<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyLocal="1" styleCategories="AllStyleCategories" version="3.12.2-București" readOnly="0" hasScaleBasedVisibilityFlag="0" minScale="100000000" simplifyDrawingTol="1" simplifyDrawingHints="0" labelsEnabled="0" simplifyMaxScale="1" simplifyAlgorithm="0" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 enableorderby="0" type="singleSymbol" symbollevels="0" forceraster="0">
    <symbols>
      <symbol name="0" clip_to_extent="1" type="line" alpha="1" force_rhr="0">
        <layer enabled="1" class="GeometryGenerator" pass="0" locked="0">
          <prop k="SymbolType" v="Line"/>
          <prop k="geometryModifier" v="with_variable(&#xd;&#xa; 'moldura',&#xd;&#xa; geometry(get_feature('auxiliar_moldura', 'id', '1')),&#xd;&#xa;CASE WHEN @moldura is not null &#xd;&#xa;THEN &#xd;&#xa;simplify_vw(intersection($geometry,  @moldura), @map_scale*0.001)&#xd;&#xa;ELSE&#xd;&#xa;simplify_vw($geometry, @map_scale*0.001)&#xd;&#xa;END&#xd;&#xa; )"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol name="@0@0" clip_to_extent="1" type="line" alpha="1" force_rhr="0">
            <layer enabled="1" class="SimpleLine" pass="0" locked="0">
              <prop k="capstyle" v="square"/>
              <prop k="customdash" v="5;2"/>
              <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="customdash_unit" v="MM"/>
              <prop k="draw_inside_polygon" v="0"/>
              <prop k="joinstyle" v="bevel"/>
              <prop k="line_color" v="255,255,255,255"/>
              <prop k="line_style" v="solid"/>
              <prop k="line_width" v="0.7"/>
              <prop k="line_width_unit" v="MM"/>
              <prop k="offset" v="0"/>
              <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="offset_unit" v="MM"/>
              <prop k="ring_filter" v="0"/>
              <prop k="use_custom_dash" v="0"/>
              <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option name="name" type="QString" value=""/>
                  <Option name="properties"/>
                  <Option name="type" type="QString" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer enabled="1" class="SimpleLine" pass="0" locked="0">
              <prop k="capstyle" v="square"/>
              <prop k="customdash" v="5;2"/>
              <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="customdash_unit" v="MM"/>
              <prop k="draw_inside_polygon" v="0"/>
              <prop k="joinstyle" v="bevel"/>
              <prop k="line_color" v="35,35,35,255"/>
              <prop k="line_style" v="solid"/>
              <prop k="line_width" v="0.35"/>
              <prop k="line_width_unit" v="MM"/>
              <prop k="offset" v="0"/>
              <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="offset_unit" v="MM"/>
              <prop k="ring_filter" v="0"/>
              <prop k="use_custom_dash" v="0"/>
              <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option name="name" type="QString" value=""/>
                  <Option name="properties"/>
                  <Option name="type" type="QString" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer enabled="1" class="MarkerLine" pass="0" locked="0">
              <prop k="average_angle_length" v="4"/>
              <prop k="average_angle_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="average_angle_unit" v="MM"/>
              <prop k="interval" v="4"/>
              <prop k="interval_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="interval_unit" v="MM"/>
              <prop k="offset" v="0"/>
              <prop k="offset_along_line" v="0"/>
              <prop k="offset_along_line_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="offset_along_line_unit" v="MM"/>
              <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="offset_unit" v="MM"/>
              <prop k="placement" v="interval"/>
              <prop k="ring_filter" v="0"/>
              <prop k="rotate" v="1"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option name="name" type="QString" value=""/>
                  <Option name="properties"/>
                  <Option name="type" type="QString" value="collection"/>
                </Option>
              </data_defined_properties>
              <symbol name="@@0@0@2" clip_to_extent="1" type="marker" alpha="1" force_rhr="0">
                <layer enabled="1" class="SimpleMarker" pass="0" locked="0">
                  <prop k="angle" v="0"/>
                  <prop k="color" v="255,0,0,255"/>
                  <prop k="horizontal_anchor_point" v="1"/>
                  <prop k="joinstyle" v="bevel"/>
                  <prop k="name" v="line"/>
                  <prop k="offset" v="0,0"/>
                  <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="offset_unit" v="MM"/>
                  <prop k="outline_color" v="255,255,255,255"/>
                  <prop k="outline_style" v="solid"/>
                  <prop k="outline_width" v="0.6"/>
                  <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="outline_width_unit" v="MM"/>
                  <prop k="scale_method" v="diameter"/>
                  <prop k="size" v="2"/>
                  <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="size_unit" v="MM"/>
                  <prop k="vertical_anchor_point" v="1"/>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option name="name" type="QString" value=""/>
                      <Option name="properties"/>
                      <Option name="type" type="QString" value="collection"/>
                    </Option>
                  </data_defined_properties>
                </layer>
                <layer enabled="1" class="SimpleMarker" pass="0" locked="0">
                  <prop k="angle" v="0"/>
                  <prop k="color" v="255,0,0,255"/>
                  <prop k="horizontal_anchor_point" v="1"/>
                  <prop k="joinstyle" v="bevel"/>
                  <prop k="name" v="line"/>
                  <prop k="offset" v="0,0"/>
                  <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="offset_unit" v="MM"/>
                  <prop k="outline_color" v="35,35,35,255"/>
                  <prop k="outline_style" v="solid"/>
                  <prop k="outline_width" v="0.3"/>
                  <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="outline_width_unit" v="MM"/>
                  <prop k="scale_method" v="diameter"/>
                  <prop k="size" v="2"/>
                  <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="size_unit" v="MM"/>
                  <prop k="vertical_anchor_point" v="1"/>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option name="name" type="QString" value=""/>
                      <Option name="properties"/>
                      <Option name="type" type="QString" value="collection"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
          </symbol>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <labeling type="simple">
    <settings calloutType="simple">
      <text-style isExpression="0" textColor="0,0,0,255" fontItalic="0" fontFamily="MS Shell Dlg 2" fontSizeUnit="Point" textOrientation="horizontal" fontCapitals="0" blendMode="0" fontWordSpacing="0" multilineHeight="1" previewBkgrdColor="255,255,255,255" textOpacity="1" fieldName="id" fontLetterSpacing="0" fontWeight="50" fontSize="10" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontUnderline="0" namedStyle="Normal" fontStrikeout="0" fontKerning="1" useSubstitutions="0">
        <text-buffer bufferDraw="0" bufferJoinStyle="128" bufferColor="255,255,255,255" bufferOpacity="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="1" bufferBlendMode="0" bufferNoFill="1" bufferSizeUnits="MM"/>
        <text-mask maskEnabled="0" maskedSymbolLayers="" maskOpacity="1" maskSize="0" maskSizeUnits="MM" maskJoinStyle="128" maskType="0" maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
        <background shapeBorderColor="128,128,128,255" shapeRadiiUnit="MM" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRotation="0" shapeType="0" shapeBorderWidth="0" shapeRadiiY="0" shapeSizeX="0" shapeRadiiX="0" shapeFillColor="255,255,255,255" shapeSVGFile="" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="MM" shapeDraw="0" shapeBlendMode="0" shapeRotationType="0" shapeSizeUnit="MM" shapeOffsetY="0" shapeSizeY="0" shapeOffsetX="0" shapeSizeType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeJoinStyle="64" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOpacity="1">
          <symbol name="markerSymbol" clip_to_extent="1" type="marker" alpha="1" force_rhr="0">
            <layer enabled="1" class="SimpleMarker" pass="0" locked="0">
              <prop k="angle" v="0"/>
              <prop k="color" v="152,125,183,255"/>
              <prop k="horizontal_anchor_point" v="1"/>
              <prop k="joinstyle" v="bevel"/>
              <prop k="name" v="circle"/>
              <prop k="offset" v="0,0"/>
              <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="offset_unit" v="MM"/>
              <prop k="outline_color" v="35,35,35,255"/>
              <prop k="outline_style" v="solid"/>
              <prop k="outline_width" v="0"/>
              <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="outline_width_unit" v="MM"/>
              <prop k="scale_method" v="diameter"/>
              <prop k="size" v="2"/>
              <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="size_unit" v="MM"/>
              <prop k="vertical_anchor_point" v="1"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option name="name" type="QString" value=""/>
                  <Option name="properties"/>
                  <Option name="type" type="QString" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </background>
        <shadow shadowOffsetAngle="135" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetUnit="MM" shadowScale="100" shadowBlendMode="6" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusAlphaOnly="0" shadowUnder="0" shadowRadiusUnit="MM" shadowOpacity="0.7" shadowDraw="0" shadowOffsetGlobal="1" shadowRadius="1.5" shadowColor="0,0,0,255" shadowOffsetDist="1"/>
        <dd_properties>
          <Option type="Map">
            <Option name="name" type="QString" value=""/>
            <Option name="properties"/>
            <Option name="type" type="QString" value="collection"/>
          </Option>
        </dd_properties>
        <substitutions/>
      </text-style>
      <text-format placeDirectionSymbol="0" wrapChar="" rightDirectionSymbol=">" plussign="0" multilineAlign="0" reverseDirectionSymbol="0" addDirectionSymbol="0" leftDirectionSymbol="&lt;" autoWrapLength="0" decimals="3" formatNumbers="0" useMaxLineLengthForAutoWrap="1"/>
      <placement preserveRotation="1" xOffset="0" maxCurvedCharAngleOut="-25" quadOffset="4" placementFlags="10" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" layerType="LineGeometry" repeatDistanceUnits="MM" fitInPolygonOnly="0" geometryGenerator="" distUnits="MM" geometryGeneratorType="PointGeometry" dist="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" centroidWhole="0" rotationAngle="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overrunDistance="0" placement="2" offsetType="0" centroidInside="0" offsetUnits="MM" distMapUnitScale="3x:0,0,0,0,0,0" priority="5" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" yOffset="0" maxCurvedCharAngleIn="25"/>
      <rendering scaleMin="0" fontLimitPixelSize="0" minFeatureSize="0" labelPerPart="0" obstacle="1" scaleVisibility="0" fontMaxPixelSize="10000" displayAll="0" drawLabels="0" mergeLines="0" limitNumLabels="0" scaleMax="0" maxNumLabels="2000" obstacleFactor="2" upsidedownLabels="0" fontMinPixelSize="3" obstacleType="0" zIndex="0"/>
      <dd_properties>
        <Option type="Map">
          <Option name="name" type="QString" value=""/>
          <Option name="properties" type="Map">
            <Option name="ObstacleFactor" type="Map">
              <Option name="active" type="bool" value="false"/>
              <Option name="type" type="int" value="1"/>
              <Option name="val" type="QString" value=""/>
            </Option>
          </Option>
          <Option name="type" type="QString" value="collection"/>
        </Option>
      </dd_properties>
      <callout type="simple">
        <Option type="Map">
          <Option name="anchorPoint" type="QString" value="pole_of_inaccessibility"/>
          <Option name="ddProperties" type="Map">
            <Option name="name" type="QString" value=""/>
            <Option name="properties"/>
            <Option name="type" type="QString" value="collection"/>
          </Option>
          <Option name="drawToAllParts" type="bool" value="false"/>
          <Option name="enabled" type="QString" value="0"/>
          <Option name="lineSymbol" type="QString" value="&lt;symbol name=&quot;symbol&quot; clip_to_extent=&quot;1&quot; type=&quot;line&quot; alpha=&quot;1&quot; force_rhr=&quot;0&quot;>&lt;layer enabled=&quot;1&quot; class=&quot;SimpleLine&quot; pass=&quot;0&quot; locked=&quot;0&quot;>&lt;prop k=&quot;capstyle&quot; v=&quot;square&quot;/>&lt;prop k=&quot;customdash&quot; v=&quot;5;2&quot;/>&lt;prop k=&quot;customdash_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;customdash_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;draw_inside_polygon&quot; v=&quot;0&quot;/>&lt;prop k=&quot;joinstyle&quot; v=&quot;bevel&quot;/>&lt;prop k=&quot;line_color&quot; v=&quot;60,60,60,255&quot;/>&lt;prop k=&quot;line_style&quot; v=&quot;solid&quot;/>&lt;prop k=&quot;line_width&quot; v=&quot;0.3&quot;/>&lt;prop k=&quot;line_width_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;offset&quot; v=&quot;0&quot;/>&lt;prop k=&quot;offset_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;offset_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;ring_filter&quot; v=&quot;0&quot;/>&lt;prop k=&quot;use_custom_dash&quot; v=&quot;0&quot;/>&lt;prop k=&quot;width_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; type=&quot;QString&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; type=&quot;QString&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>"/>
          <Option name="minLength" type="double" value="0"/>
          <Option name="minLengthMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="minLengthUnit" type="QString" value="MM"/>
          <Option name="offsetFromAnchor" type="double" value="0"/>
          <Option name="offsetFromAnchorMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="offsetFromAnchorUnit" type="QString" value="MM"/>
          <Option name="offsetFromLabel" type="double" value="0"/>
          <Option name="offsetFromLabelMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="offsetFromLabelUnit" type="QString" value="MM"/>
        </Option>
      </callout>
    </settings>
  </labeling>
  <customproperties>
    <property value="id" key="dualview/previewExpressions"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory maxScaleDenominator="1e+08" direction="1" scaleDependency="Area" barWidth="5" showAxis="0" lineSizeType="MM" minScaleDenominator="0" sizeType="MM" backgroundColor="#ffffff" opacity="1" penWidth="0" minimumSize="0" rotationOffset="270" enabled="0" sizeScale="3x:0,0,0,0,0,0" width="15" spacing="0" scaleBasedVisibility="0" height="15" spacingUnit="MM" lineSizeScale="3x:0,0,0,0,0,0" labelPlacementMethod="XHeight" diagramOrientation="Up" penColor="#000000" penAlpha="255" backgroundAlpha="255" spacingUnitScale="3x:0,0,0,0,0,0">
      <fontProperties style="" description="MS Shell Dlg 2,15.75,-1,5,50,0,0,0,0,0"/>
      <attribute color="#000000" label="" field=""/>
      <axisSymbol>
        <symbol name="" clip_to_extent="1" type="line" alpha="1" force_rhr="0">
          <layer enabled="1" class="SimpleLine" pass="0" locked="0">
            <prop k="capstyle" v="square"/>
            <prop k="customdash" v="5;2"/>
            <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
            <prop k="customdash_unit" v="MM"/>
            <prop k="draw_inside_polygon" v="0"/>
            <prop k="joinstyle" v="bevel"/>
            <prop k="line_color" v="35,35,35,255"/>
            <prop k="line_style" v="solid"/>
            <prop k="line_width" v="0.26"/>
            <prop k="line_width_unit" v="MM"/>
            <prop k="offset" v="0"/>
            <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
            <prop k="offset_unit" v="MM"/>
            <prop k="ring_filter" v="0"/>
            <prop k="use_custom_dash" v="0"/>
            <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
            <data_defined_properties>
              <Option type="Map">
                <Option name="name" type="QString" value=""/>
                <Option name="properties"/>
                <Option name="type" type="QString" value="collection"/>
              </Option>
            </data_defined_properties>
          </layer>
        </symbol>
      </axisSymbol>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings zIndex="0" dist="0" priority="0" placement="2" showAll="1" obstacle="0" linePlacementFlags="18">
    <properties>
      <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <referencedLayers/>
  <referencingLayers/>
  <fieldConfiguration>
    <field name="id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="nome">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tipo">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="Map">
              <Option name="A SER PREENCHIDO (9999)" type="QString" value="9999"/>
              <Option name="Aeromóvel (6)" type="QString" value="6"/>
              <Option name="Bonde (5)" type="QString" value="5"/>
              <Option name="Metrô (8)" type="QString" value="8"/>
              <Option name="Trem (7)" type="QString" value="7"/>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="situacao_fisica">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="Map">
              <Option name="A SER PREENCHIDO (9999)" type="QString" value="9999"/>
              <Option name="Abandonada (1)" type="QString" value="1"/>
              <Option name="Construída (3)" type="QString" value="3"/>
              <Option name="Desconhecida (0)" type="QString" value="0"/>
              <Option name="Destruída (2)" type="QString" value="2"/>
              <Option name="Em construção (4)" type="QString" value="4"/>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="posicao_relativa">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="Map">
              <Option name="A SER PREENCHIDO (9999)" type="QString" value="9999"/>
              <Option name="Elevado (3)" type="QString" value="3"/>
              <Option name="Subterrâneo (6)" type="QString" value="6"/>
              <Option name="Superfície (2)" type="QString" value="2"/>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nr_linhas">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="Map">
              <Option name="A SER PREENCHIDO (9999)" type="QString" value="9999"/>
              <Option name="Desconhecido (0)" type="QString" value="0"/>
              <Option name="Dupla (2)" type="QString" value="2"/>
              <Option name="Múltipla (3)" type="QString" value="3"/>
              <Option name="Simples (1)" type="QString" value="1"/>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="em_arruamento">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="Map">
              <Option name="A SER PREENCHIDO (9999)" type="QString" value="9999"/>
              <Option name="Não (2)" type="QString" value="2"/>
              <Option name="Sim (1)" type="QString" value="1"/>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="jurisdicao">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="Map">
              <Option name="A SER PREENCHIDO (9999)" type="QString" value="9999"/>
              <Option name="Desconhecida (0)" type="QString" value="0"/>
              <Option name="Estadual (2)" type="QString" value="2"/>
              <Option name="Federal (1)" type="QString" value="1"/>
              <Option name="Municipal (3)" type="QString" value="3"/>
              <Option name="Particular (6)" type="QString" value="6"/>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="administracao">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="Map">
              <Option name="A SER PREENCHIDO (9999)" type="QString" value="9999"/>
              <Option name="Concessionada (7)" type="QString" value="7"/>
              <Option name="Desconhecida (0)" type="QString" value="0"/>
              <Option name="Estadual (2)" type="QString" value="2"/>
              <Option name="Federal (1)" type="QString" value="1"/>
              <Option name="Municipal (3)" type="QString" value="3"/>
              <Option name="Particular (6)" type="QString" value="6"/>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="concessionaria">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="observacao">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="data_modificacao">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="controle_uuid">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="usuario_criacao">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="usuario_atualizacao">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="insumo">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="data_insumo">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="lenght_otf">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="id"/>
    <alias name="" index="1" field="nome"/>
    <alias name="" index="2" field="tipo"/>
    <alias name="" index="3" field="situacao_fisica"/>
    <alias name="" index="4" field="posicao_relativa"/>
    <alias name="" index="5" field="nr_linhas"/>
    <alias name="" index="6" field="em_arruamento"/>
    <alias name="" index="7" field="jurisdicao"/>
    <alias name="" index="8" field="administracao"/>
    <alias name="" index="9" field="concessionaria"/>
    <alias name="" index="10" field="observacao"/>
    <alias name="" index="11" field="data_modificacao"/>
    <alias name="" index="12" field="controle_uuid"/>
    <alias name="" index="13" field="usuario_criacao"/>
    <alias name="" index="14" field="usuario_atualizacao"/>
    <alias name="" index="15" field="insumo"/>
    <alias name="" index="16" field="data_insumo"/>
    <alias name="" index="17" field="lenght_otf"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" applyOnUpdate="0" field="id"/>
    <default expression="" applyOnUpdate="0" field="nome"/>
    <default expression="" applyOnUpdate="0" field="tipo"/>
    <default expression="" applyOnUpdate="0" field="situacao_fisica"/>
    <default expression="" applyOnUpdate="0" field="posicao_relativa"/>
    <default expression="" applyOnUpdate="0" field="nr_linhas"/>
    <default expression="" applyOnUpdate="0" field="em_arruamento"/>
    <default expression="" applyOnUpdate="0" field="jurisdicao"/>
    <default expression="" applyOnUpdate="0" field="administracao"/>
    <default expression="" applyOnUpdate="0" field="concessionaria"/>
    <default expression="" applyOnUpdate="0" field="observacao"/>
    <default expression="" applyOnUpdate="0" field="data_modificacao"/>
    <default expression="" applyOnUpdate="0" field="controle_uuid"/>
    <default expression="" applyOnUpdate="0" field="usuario_criacao"/>
    <default expression="" applyOnUpdate="0" field="usuario_atualizacao"/>
    <default expression="" applyOnUpdate="0" field="insumo"/>
    <default expression="" applyOnUpdate="0" field="data_insumo"/>
    <default expression="" applyOnUpdate="0" field="lenght_otf"/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" field="id" constraints="3" exp_strength="0" notnull_strength="1"/>
    <constraint unique_strength="0" field="nome" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="tipo" constraints="1" exp_strength="0" notnull_strength="1"/>
    <constraint unique_strength="0" field="situacao_fisica" constraints="1" exp_strength="0" notnull_strength="1"/>
    <constraint unique_strength="0" field="posicao_relativa" constraints="1" exp_strength="0" notnull_strength="1"/>
    <constraint unique_strength="0" field="nr_linhas" constraints="1" exp_strength="0" notnull_strength="1"/>
    <constraint unique_strength="0" field="em_arruamento" constraints="1" exp_strength="0" notnull_strength="1"/>
    <constraint unique_strength="0" field="jurisdicao" constraints="1" exp_strength="0" notnull_strength="1"/>
    <constraint unique_strength="0" field="administracao" constraints="1" exp_strength="0" notnull_strength="1"/>
    <constraint unique_strength="0" field="concessionaria" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="observacao" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="data_modificacao" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="controle_uuid" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="usuario_criacao" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="usuario_atualizacao" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="insumo" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="data_insumo" constraints="0" exp_strength="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="lenght_otf" constraints="0" exp_strength="0" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="id" exp=""/>
    <constraint desc="" field="nome" exp=""/>
    <constraint desc="" field="tipo" exp=""/>
    <constraint desc="" field="situacao_fisica" exp=""/>
    <constraint desc="" field="posicao_relativa" exp=""/>
    <constraint desc="" field="nr_linhas" exp=""/>
    <constraint desc="" field="em_arruamento" exp=""/>
    <constraint desc="" field="jurisdicao" exp=""/>
    <constraint desc="" field="administracao" exp=""/>
    <constraint desc="" field="concessionaria" exp=""/>
    <constraint desc="" field="observacao" exp=""/>
    <constraint desc="" field="data_modificacao" exp=""/>
    <constraint desc="" field="controle_uuid" exp=""/>
    <constraint desc="" field="usuario_criacao" exp=""/>
    <constraint desc="" field="usuario_atualizacao" exp=""/>
    <constraint desc="" field="insumo" exp=""/>
    <constraint desc="" field="data_insumo" exp=""/>
    <constraint desc="" field="lenght_otf" exp=""/>
  </constraintExpressions>
  <expressionfields>
    <field subType="0" typeName="" expression="$length" name="lenght_otf" comment="" precision="0" length="0" type="6"/>
    <field subType="0" typeName="" expression="$length" name="lenght_otf" comment="" precision="0" length="0" type="6"/>
  </expressionfields>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column width="-1" name="id" type="field" hidden="0"/>
      <column width="-1" name="nome" type="field" hidden="0"/>
      <column width="-1" name="tipo" type="field" hidden="0"/>
      <column width="-1" name="situacao_fisica" type="field" hidden="0"/>
      <column width="-1" name="posicao_relativa" type="field" hidden="0"/>
      <column width="-1" name="nr_linhas" type="field" hidden="0"/>
      <column width="-1" name="em_arruamento" type="field" hidden="0"/>
      <column width="-1" name="jurisdicao" type="field" hidden="0"/>
      <column width="-1" name="administracao" type="field" hidden="0"/>
      <column width="-1" name="concessionaria" type="field" hidden="0"/>
      <column width="-1" name="observacao" type="field" hidden="0"/>
      <column width="-1" name="data_modificacao" type="field" hidden="0"/>
      <column width="-1" name="usuario_criacao" type="field" hidden="0"/>
      <column width="-1" name="usuario_atualizacao" type="field" hidden="0"/>
      <column width="-1" name="insumo" type="field" hidden="0"/>
      <column width="-1" name="data_insumo" type="field" hidden="0"/>
      <column width="-1" name="lenght_otf" type="field" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
      <column width="-1" name="controle_uuid" type="field" hidden="0"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field name="administracao" editable="1"/>
    <field name="concessionaria" editable="1"/>
    <field name="controle_id" editable="1"/>
    <field name="controle_uuid" editable="1"/>
    <field name="data_insumo" editable="1"/>
    <field name="data_modificacao" editable="1"/>
    <field name="em_arruamento" editable="1"/>
    <field name="id" editable="1"/>
    <field name="insumo" editable="1"/>
    <field name="jurisdicao" editable="1"/>
    <field name="lenght_otf" editable="0"/>
    <field name="nome" editable="1"/>
    <field name="nr_linhas" editable="1"/>
    <field name="observacao" editable="1"/>
    <field name="posicao_relativa" editable="1"/>
    <field name="situacao_fisica" editable="1"/>
    <field name="tipo" editable="1"/>
    <field name="usuario_atualizacao" editable="1"/>
    <field name="usuario_criacao" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="administracao" labelOnTop="0"/>
    <field name="concessionaria" labelOnTop="0"/>
    <field name="controle_id" labelOnTop="0"/>
    <field name="controle_uuid" labelOnTop="0"/>
    <field name="data_insumo" labelOnTop="0"/>
    <field name="data_modificacao" labelOnTop="0"/>
    <field name="em_arruamento" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="insumo" labelOnTop="0"/>
    <field name="jurisdicao" labelOnTop="0"/>
    <field name="lenght_otf" labelOnTop="0"/>
    <field name="nome" labelOnTop="0"/>
    <field name="nr_linhas" labelOnTop="0"/>
    <field name="observacao" labelOnTop="0"/>
    <field name="posicao_relativa" labelOnTop="0"/>
    <field name="situacao_fisica" labelOnTop="0"/>
    <field name="tipo" labelOnTop="0"/>
    <field name="usuario_atualizacao" labelOnTop="0"/>
    <field name="usuario_criacao" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
