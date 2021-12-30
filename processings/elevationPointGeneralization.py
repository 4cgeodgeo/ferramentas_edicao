# -*- coding: utf-8 -*-

from qgis.PyQt.QtCore import QCoreApplication
from qgis.core import (QgsFeatureSink,
                       QgsProcessingAlgorithm,
                       QgsProcessingParameterFeatureSink,
                       QgsProcessingParameterEnum,
                       QgsProcessingParameterField,
                       QgsProcessingParameterVectorLayer,
                       QgsFeatureRequest,
                       QgsProcessing,
                       QgsCoordinateReferenceSystem
                       )
from qgis import processing
from qgis.utils import iface
import math 
class ElevationPointsGeneralization(QgsProcessingAlgorithm): 

    INPUT_SCALE = 'INPUT_SCALE'
    INPUT_ELEVATION_POINTS = 'INPUT_ELEVATION_POINTS'
    INPUT_COUNTOUR_LINES = 'INPUT_COUNTOUR_LINES'
    INPUT_IS_DEPRESSION_FIELD ='INPUT_IS_DEPRESSION_FIELD'
    INPUT_IS_VISIBLE_FIELD ='INPUT_IS_VISIBLE_FIELD'
    OUTPUT = 'OUTPUT'
    
    def initAlgorithm(self, config=None):
        self.addParameter(
            QgsProcessingParameterEnum(
                'INPUT_SCALE',
                self.tr('Selecione a escala para gerar as quadriculas:'),
                options = [self.tr('1:25.000'), self.tr('1:50.000'), self.tr('1:100.000'), self.tr('1:250.000')]
            )
        )
        self.addParameter(
            QgsProcessingParameterVectorLayer(
                'INPUT_ELEVATION_POINTS',
                self.tr('Selecione a camada contendo os pontos cotados'),
                types=[QgsProcessing.TypeVectorPoint]
            )
        )
        self.addParameter(
            QgsProcessingParameterVectorLayer(
                'INPUT_COUNTOUR_LINES',
                self.tr('Selecione a camada contendo as curvas de nível'),
                types=[QgsProcessing.TypeVectorLine]
            )
        )
        self.addParameter(
            QgsProcessingParameterField(
                'INPUT_IS_DEPRESSION_FIELD',
                self.tr('Selecione o campo que informa se é depressão ou não'), 
                type=QgsProcessingParameterField.Numeric, 
                parentLayerParameterName='INPUT_COUNTOUR_LINES', 
                allowMultiple=False, 
                defaultValue='depressao')
            )
        self.addParameter(
            QgsProcessingParameterField(
                'INPUT_IS_VISIBLE_FIELD',
                self.tr('Selecione o campo que informa se o ponto é visível ou não'), 
                type=QgsProcessingParameterField.Numeric, 
                parentLayerParameterName='INPUT_ELEVATION_POINTS', 
                allowMultiple=False, 
                defaultValue='visivel')
            )
        self.addParameter(
            QgsProcessingParameterFeatureSink(
                self.OUTPUT,
                self.tr('Generalização de Ponto Cotado')
            )
        ) 

    def processAlgorithm(self, parameters, context, feedback):      
        feedback.setProgressText('Iniciando...')
        returnMessage = 'Camada Generalização de Ponto Cotado gerada'
        gridScaleParam = self.parameterAsEnums(parameters,self.INPUT_SCALE, context)[0]
        pointLayer = self.parameterAsVectorLayer( parameters,self.INPUT_ELEVATION_POINTS, context )
        countourLayerpre = self.parameterAsVectorLayer( parameters,self.INPUT_COUNTOUR_LINES, context )
        isDepressionField = self.parameterAsFields (parameters,self.INPUT_IS_DEPRESSION_FIELD, context)[0]
        isVisibleField = self.parameterAsFields (parameters,self.INPUT_IS_VISIBLE_FIELD, context)[0]
        pointLayerCopy = self.runAddCount(pointLayer)
        self.runCreateSpatialIndex(pointLayerCopy)
        countourLayerLine = self.runAddCount(countourLayerpre)
        self.runCreateSpatialIndex(countourLayerLine)
        countourLayerHoles = self.lineToPolygons(countourLayerLine,context, feedback)
        countourLayer = self.fillHoles(countourLayerHoles, context, feedback)
        self.fillField(countourLayerLine, countourLayer)
        summitsOrBottoms = []
        self.selectSummitsAndBottoms(countourLayer, summitsOrBottoms)
        pointsIdsSelected = []
        if (gridScaleParam==0):
            gridScale = 25000
        elif (gridScaleParam==1):
            gridScale = 50000
        if (gridScaleParam==2):
            gridScale = 100000
        elif (gridScaleParam==3):
            gridScale = 250000
        gridSize = 4*gridScale/100
        crs = QgsCoordinateReferenceSystem("EPSG:4326")
        pointLayerCopy4326 = self.reprojectLayer(pointLayerCopy, crs)
        ptLyrExt = pointLayerCopy4326.extent()
        center = ptLyrExt.center()
        utmString = self.getSirgasAuthIdByPointLatLong(center.y(), center.x())
        utm = QgsCoordinateReferenceSystem(utmString)
        pointLayerCopyReprojected = self.reprojectLayer(pointLayerCopy, utm)
        ptLyrExtReprojected = pointLayerCopyReprojected.extent()
        xmin = ptLyrExtReprojected.xMinimum()
        xmax = ptLyrExtReprojected.xMaximum()
        ymin = ptLyrExtReprojected.yMinimum()
        ymax = ptLyrExtReprojected.yMaximum()
        xmin, xmax, ymin, ymax = self.processExtent(xmin, xmax, ymin, ymax, gridSize)
        grid = self.makeGrid(gridSize, utm, xmin, xmax, ymin, ymax, parameters, context, feedback)
        reprojectGrid = self.reprojectLayer(grid,pointLayer.sourceCrs())
        self.generalizePoint(reprojectGrid, pointLayer, pointsIdsSelected, summitsOrBottoms, isDepressionField)

        provider = pointLayer.dataProvider()
        pointLayer.startEditing()
        i=0
        for point in pointLayer.getFeatures():
            if point.id() in pointsIdsSelected:
                pointLayer.changeAttributeValue(point.id(), provider.fieldNameIndex(isVisibleField), 1) #1 = visivel, 2 = não visivel, 9999 = desconhecido
            else:
                pointLayer.changeAttributeValue(point.id(), provider.fieldNameIndex(isVisibleField), 2)
            i+=1
        return{self.OUTPUT: returnMessage}

    def processExtent(self, xmin, xmax, ymin, ymax, gridSize):
        return ((int(xmin/gridSize))*gridSize, (int(xmax/gridSize)+1)*gridSize, (int(ymin/gridSize))*gridSize, (int(ymax/gridSize)+1)*gridSize)

    def makeGrid(self, gridSize, CRS, xmin, xmax, ymin, ymax, parameters, context, feedback):
        extent = str(str(xmin)+", "+str(xmax)+", "+str(ymin)+", "+str(ymax))
        output = processing.run(
            "native:creategrid",
            {
                'TYPE':2,
                'EXTENT': extent,
                'HSPACING':gridSize,
                'VSPACING':gridSize,
                'HOVERLAY':0,
                'VOVERLAY':0,
                'CRS':CRS,
                'OUTPUT': parameters['OUTPUT']
            }
        )
        return output['OUTPUT']

    def lineToPolygons(self, layer,context, feedback):
            r = processing.run(
                'native:polygonize',
                {   'INPUT' : layer, 
                    'KEEP_FIELDS' : True,
                    'OUTPUT' : 'TEMPORARY_OUTPUT'
                },
                context = context,
                feedback = feedback
            )
            return r['OUTPUT']  
    
    def fillHoles(self, layer, context, feedback):
        r = processing.run(
            'native:deleteholes',
            {   'INPUT' : layer,
                'OUTPUT' : 'TEMPORARY_OUTPUT'
            },
            context = context,
            feedback = feedback
        )
        return r['OUTPUT']  

    def fillField(self, countourLayer, countourLayerPoly):
        countourLayerPoly.startEditing()
        pr = countourLayerPoly.dataProvider()
        updateMap = {}
        for feature1 in pr.getFeatures():
            AreaOfInterest = feature1.geometry().boundingBox()
            request = QgsFeatureRequest().setFilterRect(AreaOfInterest)
            for feature2 in countourLayer.getFeatures(request):
                if feature2.geometry().touches(feature1.geometry()):
                    fv = {}
                    for field in feature2.fields():
                        fieldIdx = pr.fields().indexFromName( field.name())
                        fv[fieldIdx] = feature2[field.name()]
                        
                        feature1[field.name()] =  feature2[field.name()]
                    updateMap[feature1.id()] = fv
        pr.changeAttributeValues( updateMap )
        countourLayerPoly.commitChanges()
        return False

    def selectSummitsAndBottoms(self, countourLayer, summitsOrBottoms):
        toBeAdd = False
        for countour in countourLayer.getFeatures():
            cGeom = countour.geometry()
            toBeRemoved = []
            if (not summitsOrBottoms):
                summitsOrBottoms.append(countour)
                continue
            
            for SoB in summitsOrBottoms:
                toBeAdd = True
                SoBgeom = SoB.geometry()
                if (cGeom.within(SoBgeom)):
                    toBeRemoved.append(SoB)
                if (SoBgeom.within(cGeom)):
                    toBeAdd = False
                    break
            if (toBeAdd):
                summitsOrBottoms.append(countour)
            for tBR in toBeRemoved:
                summitsOrBottoms.remove(tBR)

    def getSirgasAuthIdByPointLatLong(self, lat, long):
        """
        Calculates SIRGAS 2000 epsg.
        <h2>Example usage:</h2>
        <ul>
        <li>Found: getSirgarAuthIdByPointLatLong(-8.05389, -34.881111) -> 'ESPG:31985'</li>
        <li>Not found: getSirgarAuthIdByPointLatLong(lat, long) -> ''</li>
        </ul>
        """
        zone_number = math.floor(((long + 180) / 6) % 60) + 1
        if lat >= 0:
            zone_letter = 'N'
        else:
            zone_letter = 'S'
        return self.getSirgasEpsg('{0}{1}'.format(zone_number, zone_letter))

    def getSirgasEpsg(self, key):
        options = {
            "11N" : "EPSG:31965", 
            "12N" : "EPSG:31966", 
            "13N" : "EPSG:31967", 
            "14N" : "EPSG:31968", 
            "15N" : "EPSG:31969", 
            "16N" : "EPSG:31970", 
            "17N" : "EPSG:31971", 
            "18N" : "EPSG:31972", 
            "19N" : "EPSG:31973", 
            "20N" : "EPSG:31974", 
            "21N" : "EPSG:31975", 
            "22N" : "EPSG:31976", 
            "17S" : "EPSG:31977", 
            "18S" : "EPSG:31978", 
            "19S" : "EPSG:31979", 
            "20S" : "EPSG:31980", 
            "21S" : "EPSG:31981", 
            "22S" : "EPSG:31982", 
            "23S" : "EPSG:31983", 
            "24S" : "EPSG:31984", 
            "25S" : "EPSG:31985"
        }
        return options[key] if key in options else ""


    def runAddCount(self, inputLyr):
        output = processing.run(
            "native:addautoincrementalfield",
            {
                'INPUT':inputLyr,
                'FIELD_NAME':'AUTO',
                'START':0,
                'GROUP_FIELDS':[],
                'SORT_EXPRESSION':'',
                'SORT_ASCENDING':False,
                'SORT_NULLS_FIRST':False,
                'OUTPUT':'TEMPORARY_OUTPUT'
            }
        )
        return output['OUTPUT']
    
    def runCreateSpatialIndex(self, inputLyr):
        processing.run(
            "native:createspatialindex",
            {'INPUT':inputLyr}
        )

        return False
    
    def generalizePoint(self, grid, pointLayer, pointsIdsSelected, summitsOrBottoms, isDepressionField):
        isDep = 1
        isNotDep = 0  
        for g in grid.getFeatures():
            request = QgsFeatureRequest().setFilterRect( g.geometry().boundingBox() )  
            pointsIdsSelectedinGrid=[]
            summitsOrBottomsPoints = {}
            hasSoBPoints = False
            for point in pointLayer.getFeatures(request):
                for SoB in summitsOrBottoms:
                    if (point.geometry().within(SoB.geometry())):
                        if (SoB['id'] in summitsOrBottomsPoints.keys()):
                            if (SoB[isDepressionField] == isNotDep):
                                if (summitsOrBottomsPoints[SoB['id']]['cota']<point['cota']):
                                    summitsOrBottomsPoints[SoB['id']] = point
                            if (SoB[isDepressionField] == isDep):
                                if (summitsOrBottomsPoints[SoB['id']]['cota']>point['cota']):
                                    summitsOrBottomsPoints[SoB['id']] = point
                            break
                        summitsOrBottomsPoints[SoB['id']]=point
                        hasSoBPoints = True
                        pointsIdsSelectedinGrid = []
                        break
                if (not hasSoBPoints):
                    if (not pointsIdsSelectedinGrid):
                        pointsIdsSelectedinGrid.append(point.id())
                        continue
                    if (pointLayer.getFeature(pointsIdsSelectedinGrid[-1])['cota']>point['cota']):
                        pointsIdsSelectedinGrid.append(point.id())
            if (pointsIdsSelectedinGrid):
                if (pointsIdsSelectedinGrid[-1] not in pointsIdsSelected):
                    pointsIdsSelected.append(pointsIdsSelectedinGrid[-1])
            if (summitsOrBottomsPoints):
                for point in summitsOrBottomsPoints.values():
                    pointsIdsSelected.append(point.id())

    def reprojectLayer(self, layer, crs):
        output = processing.run(
            "native:reprojectlayer",
            {
                'INPUT':layer,
                'TARGET_CRS':crs,
                'OUTPUT':'TEMPORARY_OUTPUT'
            }
        )
        return output['OUTPUT']    
                
    def outLayer(self, parameters, context, features, setCRS):
        

        (sink, newLayer) = self.parameterAsSink(
            parameters,
            self.OUTPUT,
            context,
            features[0].fields(),
            4,
            setCRS
        )

        for feature in features:
            sink.addFeature(feature, QgsFeatureSink.FastInsert)
        return newLayer
        
    def tr(self, string):
        return QCoreApplication.translate('Processing', string)

    def createInstance(self):
        return ElevationPointsGeneralization()

    def name(self):
        return 'elevationpointsgeneralization'

    def displayName(self):
        return self.tr('Generalização de pontos cotados')

    def group(self):
        return self.tr('Edição')

    def groupId(self):
        return 'edicao'

    def shortHelpString(self):
        return self.tr("O algoritmo generaliza os pontos cotados baseados na escala")
    
