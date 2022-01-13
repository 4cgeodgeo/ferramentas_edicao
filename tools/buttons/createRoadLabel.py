from pathlib import Path
import numpy as np
import math

from qgis.core import (QgsCoordinateReferenceSystem, QgsGeometryUtils,
                       QgsCoordinateTransformContext, QgsDistanceArea,
                       QgsFeature, QgsFeatureRequest, QgsGeometry,
                       QgsLineString, QgsPointXY, QgsProject, QgsSpatialIndex,
                       QgsUnitTypes, QgsRectangle)
from qgis.gui import QgsMapToolEmitPoint

from .baseTools import BaseTools
from .utils.comboBox import ComboBox


class CreateRoadLabel(QgsMapToolEmitPoint, BaseTools):

    def __init__(self, iface, toolBar, mapTypeSelector, productTypeSelector, scaleSelector):
        super().__init__(iface.mapCanvas())
        self.iface = iface
        self.toolBar = toolBar
        self.dstLyr = None
        self.mapTypeSelector = mapTypeSelector
        self.productTypeSelector = productTypeSelector
        self.scaleSelector = scaleSelector
        self.mapCanvas = iface.mapCanvas()
        self.box = ComboBox(self.iface.mainWindow())
        self.canvasClicked.connect(self.mouseClick)

    def setupUi(self):
        buttonImg = Path(__file__).parent / 'icons' / 'genericSymbol.png'
        self._action = self.createAction(
            'Legenda Via Desl.',
            None,
            lambda _: None,
            self.tr('Cria feições em "edicao_texto_generico_l" cujo texto é o número de faixas da feição em "infra_via_deslocamento"'),
            self.tr('Cria feições em "edicao_texto_generico_l" cujo texto é o número de faixas da feição em "infra_via_deslocamento"'),
            self.iface
        )
        self._action.setCheckable(True)
        self.setAction(self._action)
        self.toolBar.addAction(self._action)
        self.iface.registerMainWindowAction(self._action, '')

    def mouseClick(self, pos, btn):
        if self.isActive() and self.dstLyr:
            if self.productTypeSelector.currentText() != 'Topográfica':
                self.displayErrorMessage(self.tr(
                        'Ferramenta válida apenas para Carta Topográfica'
                    ))
            else:
                self.tol = self.mapCanvas.mapSettings().mapUnitsPerPixel() * self.getScale() / 10000
                p = self.mapCanvas.mapSettings().mapToLayerCoordinates(self.srcLyr, pos)
                rect = QgsRectangle(p.x() - self.tol, p.y()-self.tol, p.x() + self.tol, p.y() + self.tol)
                feats = [x for x in self.srcLyr.getFeatures(rect)]
                if not feats:
                    self.displayErrorMessage('Não foi encontrado uma via de deslocamento dentro da tolerância')
                for feat in feats:
                    if self.checkFeature(feat):
                        self.createFeature(feat, pos)
                    else:
                        self.displayErrorMessage(self.tr(
                            'Feição inválida. A via de deslocamento deve possuir 3 ou mais faixas e ter situação física "construída"'
                        ))
                    break

    @staticmethod
    def checkFeature(feat):
        return all((int(feat.attribute('situacao_fisica')) == 3, int(feat.attribute('nr_faixas')) >=3))

    def createFeature(self, feat, pos):
        toInsert = QgsFeature(self.dstLyr.fields())
        toInsert.setAttribute('texto_edicao', f"{feat.attribute('nr_faixas')} FAIXAS")
        toInsert.setAttribute('estilo_fonte', 'Light Condensed Italic')
        toInsert.setAttribute('espacamento', 0)
        toInsert.setAttribute('carta_simbolizacao', self.getMapType())
        toInsert.setAttribute('tamanho_txt', 6)
        toInsertGeom = self.getLabelGeometry(feat, pos)
        toInsert.setGeometry(toInsertGeom)
        self.dstLyr.startEditing()
        self.dstLyr.addFeature(toInsert)
        self.dstLyr.triggerRepaint()

    def getLabelGeometry(self, feat, clickPos):
        geom = feat.geometry()
        interpolateSize = 1.5 * self.tol
        clickPosGeom = QgsGeometry.fromWkt(clickPos.asWkt())
        posClosestV = geom.lineLocatePoint(clickPosGeom)
        start = posClosestV - interpolateSize/2
        end = posClosestV + interpolateSize/2
        if interpolateSize > geom.length():
            toExtend = interpolateSize - geom.length()
            geom = geom.extendLine(toExtend/2,toExtend/2)
        elif posClosestV + interpolateSize/2 > geom.length():
            diff = (posClosestV + interpolateSize/2) - geom.length()
            geom = geom.extendLine(0,diff)
            end = geom.length()
        elif posClosestV - interpolateSize/2 < 0:
            diff =  interpolateSize/2 - posClosestV
            geom = geom.extendLine(diff,0)
            start = 0
            end += diff
        closestV = geom.interpolate(posClosestV)
        toInsertGeom = QgsGeometry(self.buildLineFromGeomDist(start, end, geom))
        toInsertGeom.translate(*self.getTransformParams(closestV,clickPos))
        return toInsertGeom

    def buildLineFromGeomDist(self, start, end, geom):
        xCoords = []
        yCoords = []
        if geom.isMultipart():
            for point in geom.asMultiPolyline()[0]:
                xCoords.append(point.x())
                yCoords.append(point.y())
        else:
            for point in geom.asPolyline():
                xCoords.append(point.x())
                yCoords.append(point.y())
        return QgsLineString(xCoords,yCoords).curveSubstring(start,end)

    def getTransformParams(self, ref, clickPos):
        ref = ref.asPoint()
        xTranslate = clickPos.x() - ref.x()
        yTranslate =  clickPos.y() - ref.y()
        xTranslate, yTranslate = self.scaleTransform(xTranslate, yTranslate)
        return xTranslate, yTranslate

    def scaleTransform(self, x, y):
        d = self.tol
        scaleFactor = (d**2 / ((x**2 + y**2)))**0.5
        return scaleFactor*x, scaleFactor*y

    def getLayers(self):
        srcLyr = QgsProject.instance().mapLayersByName('infra_via_deslocamento_l')
        dstLyr = QgsProject.instance().mapLayersByName('edicao_texto_generico_l')
        if len(srcLyr) == 1:
            self.srcLyr = srcLyr[0]
        else:
            self.displayErrorMessage(self.tr(
                'Camada "infra_via_deslocamento_l" não encontrada'
            ))
            return None
        if len(dstLyr) == 1:
            self.dstLyr = dstLyr[0]
        else:
            self.displayErrorMessage(self.tr(
                'Camada "edicao_texto_generico_l" não encontrada'
            ))
            return None
        return True
