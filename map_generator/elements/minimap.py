from qgis.core import QgsProject, QgsLayerTreeGroup
from PyQt5.QtGui import * 
from .map_utils import MapParent

class MiniMap(MapParent):
	def __init__(self):		
		self.layers_to_show = []

	def setParams(self):
		pass


	def make(self, composition, selected_feature, layers, showLayers = False):	
		self.deleteGroups(['minimap'])	

		root = QgsProject.instance().layerTreeRoot()		
		miniMapGroup_node = QgsLayerTreeGroup('minimap')	
		miniMapGroup_node.setItemVisibilityChecked(False)								
		
		map_extent = selected_feature.geometry().convexHull().boundingBox()
		
		# Creating layers to lock map
		layers_to_lock = []
		layers_to_lock.extend(layers['minimap'])
		layers_to_lock.extend(layers['images'])
		self.updateMapItem(composition, map_extent, layers_to_lock)	

		if showLayers:
			for map_layer in layers_to_lock:
				miniMapGroup_node.addLayer(map_layer)
			root = QgsProject.instance().layerTreeRoot()		
			root.addChildNode(miniMapGroup_node)

		return layers['id_minimap']
		
		#  quando as camadas forem passadas como parametro
		# miniMapGroup_node.setItemVisibilityChecked(False)
		# QgsProject.instance().addMapLayer(camadaAdicionada, False)
		# miniMapGroup_node.addLayer(camadaAdicionada)
		# root = QgsProject.instance().layerTreeRoot()		
		# root.addChildNode(miniMapGroup_node)
    
	def updateMapItem(self, composition, map_extent, layers_to_lock, mapItem=None):    	
		if mapItem is None:
			mapItem = composition.itemById("map_miniMap")
		if mapItem is not None:
			mapSize = mapItem.sizeWithUnits()
			mapItem.setFixedSize(mapSize)			
			if layers_to_lock is not None:		 	
				mapItem.setLayers(layers_to_lock)
			mapItem.setExtent(map_extent)		
			mapItem.refresh()
