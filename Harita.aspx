  <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Harita.aspx.cs" Inherits="OpenlayersMap.Harita" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8"/>
    <title>Openlayers</title>
    
	<link href="css/ol.css" rel="stylesheet" type="text/css" />
	<link href="css/menu.css" rel="stylesheet" type="text/css" />
	<link href="css/layercontrols.css" rel="stylesheet" type="text/css" />
	<link href="css/mapconzoom.css" rel="stylesheet" type="text/css" />
	<link href="css/koordinat.css" rel="stylesheet" type="text/css" />
	<link href="css/mapcontrols.css" rel="stylesheet" type="text/css"/>
	
    <script src="js/ol-debug.js" type="text/javascript"></script>
	<script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <style type="text/css">
	    
        #mapCon
        {
            width: 1000px;
            height: 400px;
            margin-left:150px;
            position: absolute;
            margin-top:0px;
        }   
      
		#cr
        {
        	background-color: #dab09b;
        	position: fixed;
        	bottom: 0px;
        	width: 900px;
        	height: 50px;;
        	text-align: center;
        	line-height: 30px;
        	font-size: 15px; 
			color:white;
           
         }
        

		
        .auto-style3 {
            text-align: left;
            color: #990000;
            font-size: 30px;
        }
        

		
        .auto-style4 {
            width: 1300px;
            height: 80px;
        }
        .auto-style5 {
            background-color: #003F7F;
        }
                

		
        .auto-style7 {
            width: 124px;
            height: 59px;
            margin-left: 778px;
            margin-top: 0;
        }
        .auto-style8 {
            width: 907px;
        }
        

		
        .auto-style9 {
            color: #00CC00;
        }
        .auto-style10 {
            color: #FF33CC;
        }
        .auto-style11 {
            color: #0066FF;
        }
        .auto-style12 {
            color: #CC00CC;
        }
        .auto-style13 {
            color: #FF9900;
        }
        .auto-style14 {
            font-size: 45px;
        }
        

		
        .auto-style15 {
            left: 8px;
            top: 148px;
            margin-top: 0px;
        }
        .auto-style16 {
            right: 40px;
            top: 23px;
            height: 55px;
            margin-top: 17;
        }
        

		
        .auto-style17 {
            height: 30px;
            margin-top: 5;
        }
        .auto-style18 {
            overflow: auto;
            width: 114px;
            height: 28px;
        }
        .auto-style19 {
            width: 151px;
            height: 28px;
        }
        

		
    </style>
     <!-- loading jsPanel css -->
    <link rel="stylesheet" href="jspanel.css">
</head>

<body bgcolor="#003f7f">
        <form id="form1" runat="server">
    &nbsp;<!-- Your HTML goes here --><!-- loading jsPanel javascript --><script src="jspanel.js"></script><!-- optionally load jsPanel extensions --><script src="extensions/contextmenu/jspanel.contextmenu.js"></script><script src="extensions/hint/jspanel.hint.js"></script><script src="extensions/modal/jspanel.modal.js"></script><script src="extensions/tooltip/jspanel.tooltip.js"></script><script src="extensions/dock/jspanel.dock.js"></script><div class="auto-style5">
           <table class="auto-style4"> <tr>
       &nbsp; &nbsp; &nbsp;<td class="auto-style8">
           &nbsp;<img alt="" class="auto-style7" src="img/icon.png" /></td>
       <td class="auto-style3"><strong style="font-family: 'Comic Sans MS'; font-size: 40px">&nbsp;</strong><strong style="font-family: 'Comic Sans MS'; "><span class="auto-style9"><span class="auto-style14">M</span></span><span class="auto-style14"><span class="auto-style10">Y</span> <span class="auto-style11">M</span></span><span class="auto-style12"><span class="auto-style14">A</span></span></strong><strong style="font-family: 'Comic Sans MS'; font-size: 40px"><span class="auto-style13">P</span></strong></td>
       </tr>
    </table>
            </div>
            <div class="auto-style17">
               
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
               <input type="button" name="button1" id="kapi" value="Kapı Ekle" style="font-style: inherit; text-transform: uppercase; font-family: 'Times New Roman'; display: inline; margin: auto; border-style: ridge; border-color: #000000; background-color: #CCCCCC;" class="auto-style18"> 
             <input type="button" name="button" id="mahalle" value="Mahalle Ekle" style="padding: inherit; border: 2px inset #000000; font-family: 'Times New Roman'; font-style: inherit; text-transform: uppercase; background-color: #CCCCCC;" class="auto-style19">
     
              
            </div>
	
	<div id="mapCon" class="auto-style15" style="border: medium groove #000000">
	<div id="mouse-position"></div>
		<div id="layerControl" class="layerControl">
            <div class="title"><label></label></div>
            <ul id="layerTree" class="layerTree"></ul>
        </div>
	
	
	
	<div id="menu" class="auto-style16" style="top: 10px">
        
        <select id="type">
            <option value="None" selected="selected">None</option>
            <option value="Point">Point</option>
            <option value="LineString">LineString</option>
            <option value="Polygon">Polygon</option>
            <option value="Circle">Circle</option>
            <option value="Square">Square</option>
            <option value="Box">Box</option>
        </select>
		<span id="buyult" title="" onclick="zoomin()"></span>
		<span id="kucult" title="" onclick="zoomout()"></span>
		<span id="tamekran" title="" onclick="fullscreen()"></span>
    </div>

          
	</div>
    
    
	    
		<input name="111" type="image"  src="img/123.png"  id="btn55" onclick="btn()"  style="position:absolute; right:7px; top:300px;" title="Katmanlar"/>
<!--input name="111" type="button"  value="btn55"  id="btn" onclick="btn()"  style="position:absolute; left:320px; top:10px;"-->
            <div>
            </div>
    <script type="text/javascript">

            // create a demo jsPanel
 

     


var btn1=document.getElementById('Button1');
		var box1=document.getElementById('layerControl');
		function btn(){ 
			if(btn1.value=="")
			{box1.style.display='none';btn1.value="btn55";}
			else{box1.style.display='';btn1.value="btn55";}
		}
		$("#layerControl").hide();
		
        var mousePositionControl = new ol.control.MousePosition({
        
            coordinateFormat: ol.coordinate.createStringXY(4),
       
            projection: 'EPSG:4326',
  
            className: 'custom-mouse-position',
       
            target: document.getElementById('mouse-position'),
            
            undefinedHTML: '&nbsp;'
        });
		
	
        var scaleLineControl = new ol.control.ScaleLine({
            
            units: "metric" 
        });
		
	 
        var overviewMapControl = new ol.control.OverviewMap({
            //（see in overviewmap-custom.html to see the custom CSS used）
            className: 'ol-overviewmap ol-custom-overviewmap', 
           
            layers: [
                
            ],
        
            collapseLabel: '\u00BB',
            
            label: '\u00AB',
            
            collapsed: true//false 
        });
		
        var typeSelect = document.getElementById('type');
      
        var draw;
	
        var layer = new Array();
    
        var layerName = new Array();
        
        var layerVisibility = new Array();
		
	
        function loadLayersControl(map, id) {
       
            var treeContent = document.getElementById(id); 
      
            var layers = map.getLayers();
            for (var i = 0; i < layers.getLength() ; i++) {
      
                layer[i] = layers.item(i);
                layerName[i] = layer[i].get('name');
                layerVisibility[i] = layer[i].getVisible();

                var elementLi = document.createElement('li');
         
                treeContent.appendChild(elementLi); 
           
                var elementInput = document.createElement('input');
                elementInput.type = "checkbox";
                elementInput.name = "layers";
                elementLi.appendChild(elementInput);
                
            
                var elementLable = document.createElement('label');
                elementLable.className = "layer";
             
                setInnerText(elementLable, layerName[i]);
                elementLi.appendChild(elementLable);

                if (layerVisibility[i]) {
                    elementInput.checked = true;
                }
                
                addChangeEvent(elementInput, layer[i]);  
            }
        }
        
    
        function addChangeEvent(element, layer) {
            element.onclick = function () {
                if (element.checked) {
                  
                  layer.setVisible(true);
              }
              else {
                 
                  layer.setVisible(false); 
              }
            };
            
        }
       
        function setInnerText(element, text) {
            if (typeof element.textContent == "string") {
                element.textContent = text;
            } else {
                element.innerText = text;
            }
        }
		function Circle1(){}
		
		
		
	
        var map = new ol.Map({
           
            target: 'mapCon', 
        
            layers: [
           
                new ol.layer.Tile({
                 
                    source: new ol.source.OSM(),
					url: 'http://server.arcgisonline.com/ArcGIS/rest/services/' +
				    	'World_Street_Map/MapServer/tile/{z}/{y}/{x}'
                }),
                new ol.layer.Tile({
				name: 'Satellite Map',
				type: 'base',				
				source: new ol.source.XYZ({
					url: 'http://server.arcgisonline.com/ArcGIS/rest/services/' +
				    	'World_Imagery/MapServer/tile/{z}/{y}/{x}'
				})
			}),
			new ol.layer.Tile({
				name: 'Street Map',
				type: 'base',
				source: new ol.source.XYZ({
					url: 'http://server.arcgisonline.com/ArcGIS/rest/services/' +
				    	'World_Street_Map/MapServer/tile/{z}/{y}/{x}'
				})
			}),
				
                
            ],
			
           
            view: new ol.View({
                center: new ol.proj.fromLonLat([35.243320, 38.963745]),
                zoom: 6  
            }),
			
			
            controls: ol.control.defaults({
                attributionOptions: ({

                    collapsible: true
                })
            }).extend([
			mousePositionControl,
			scaleLineControl,
			new ol.control.FullScreen(),
			overviewMapControl
			])
        });
		
		
		
		var fullscreen = function() {
			var elem = document.body;
			if (elem.webkitRequestFullScreen) {
				elem.webkitRequestFullScreen()
			} else {
			if (elem.mozRequestFullScreen) {
				elem.mozRequestFullScreen()
			} else {
				if (elem.msRequestFullscreen) {
					elem.msRequestFullscreen()
				} else {
					if (elem.requestFullScreen) {
						elem.requestFullscreen()
					} else {
						alert("")
						}	
					}
				}
			}
		};
		var zoomin = function() {
			var view = map.getView();
			var zoom = view.getZoom();
			view.setZoom(zoom + 1);
		}
		var zoomout = function() {
			var view = map.getView();
			var zoom = view.getZoom();
			view.setZoom(zoom - 1);
		}
		
		
	
        var zoomslider = new ol.control.ZoomSlider(); 
        map.addControl(zoomslider);

   
		

        var source = new ol.source.Vector({ wrapX: false });
        
		var vector = new ol.layer.Vector({
            source: source,
            style: new ol.style.Style({
                fill: new ol.style.Fill({
                    color: 'rgba(0, 0, 255, 0.2)'
                }),
                stroke: new ol.style.Stroke({
                    color: '#6A5ACD',
                    width: 2
                }),
                image: new ol.style.Circle({
                    radius: 7,
                    fill: new ol.style.Fill({
                        color: '#ffcc33'
                    })
                })
            }),
			name: 'Vector'
        });
        map.addLayer(vector);
		
 
       

  
        function addInteraction() {
     
            var value = typeSelect.value;
            if (value !== 'None') {
                if (source == null) {
                    source = new ol.source.Vector({ wrapX: false });
         
                    vector.setSource(source);
                }
                var geometryFunction, maxPoints;
                if (value === 'Square') {
                    value = 'Circle';
 
                    geometryFunction = ol.interaction.Draw.createRegularPolygon(4);

                } else if (value === 'Box') {
                    value = 'LineString';
                    maxPoints = 2;
                    geometryFunction = function (coordinates, geometry) {
                        if (!geometry) {
                            
                            geometry = new ol.geom.Polygon(null);
                        }
                        var start = coordinates[0];
                        var end = coordinates[1];
                        geometry.setCoordinates([
                            [start, [start[0], end[1]], end, [end[0], start[1]], start]
                        ]);
                        return geometry;
                    };
                  }

                draw = new ol.interaction.Draw({
      
                    source: source,
                    /** @type {ol.geom.GeometryType} */
                    type: value,
                    
                    geometryFunction: geometryFunction,
                  
                    maxPoints: maxPoints
                });
                map.addInteraction(draw);
            }
            else {
                source = null;
               
                vector.setSource(source);
            }
        }

        
        typeSelect.onchange = function (e) {
           
            map.removeInteraction(draw);
           
            addInteraction();
        };
        
        addInteraction();
		
	
        loadLayersControl(map, "layerTree");

           var kapi_ekle = document.getElementById("kapi");
        kapi_ekle.onclick = function () {
		   jsPanel.create({
        id: "kapi_ekle_panel",
        theme: 'success',
        headerTitle: 'kapı ekle',
        position: 'center-top 0 58', 
        contentSize: '300 200', 
        content: 'Kapı No: &nbsp; <input id="kapi_no" type="text"/> <br><br>Lat-Long: &nbsp;<input id="Koordinat" type="text"/><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button style=" background-color:#ecab53;height:30px;width:80px" id="kapi_kaydet" class="btn btn-success">Ekle</button>',
        callback: function () {
            this.content.style.padding = '20px';
        }
        });
	    }

        var mah_ekle = document.getElementById("mahalle");
        mah_ekle.onclick = function () {
		   jsPanel.create({
        id: "mahalle_ekle_panel",
        theme: 'success',
        headerTitle: 'Mahalle ekle',
        position: 'center-top 0 58', 
        contentSize: '300 230', 
        content: 'Mahalle No: <input id="mahalle_no" type="text"/><br><br>Mahalle Adı: <input id="Mah_adi" type="text"/><br><br>Lat-Long: &nbsp; &nbsp; <input id="Koordinat" type="text"/><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button style=" background-color:#ecab53;height:30px;width:80px " id="mahalle_kaydet" class="btn btn-success">Ekle</button>',
        callback: function () {
            this.content.style.padding = '20px';
        }
        });
	    }
		
        
		
    </script>
            </form>
</body>
</html>
