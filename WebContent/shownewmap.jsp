<html>

<link rel="stylesheet" href="OpenLayers-6.9/libs/v6.9.0-dist/ol.css" type="text/css">
<script src="OpenLayers-6.9/libs/v6.9.0-dist/ol.js"></script>



<script type="text/javascript">
function init(){
        var lat=<%=request.getParameter("lat") %>; //latinDec in database
        var lon=<%=request.getParameter("long")%>; //longinDec in database
     	
		const map = new ol.Map({
            
        	view: new ol.View({
                center: ol.proj.fromLonLat([lon,lat]),//logitude,lattitude //[8228578.384724349,2104081.075738948],   //transworld viman nagar
                zoom: 12,
                maxZoom: 15
            }),
            
            target: 'map',
            
             layers: [
            	 new ol.layer.Tile({
            			source : new ol.source.XYZ({
            	  			 attributions:['<a href="http://myfleetview.net:8181/FleetViewtest1/index.jsp" style="text-decoration:none"><font face="Hemi Head 426" size="04" color="#0853A0">FleetView <br><font face="Hemi Head 426" size="01" color="#0853A0">Transworld Technologies Ltd.</a>'],
            	 			attributionsCollapsible: false,
            	 			url: 'http://209.58.136.48:8224/osm/{z}/{x}/{y}.png'
            	 		})
            		})
                ] 
                

        });
	 
        	         	 
        	 var mark = new ol.Feature({
     			geometry: new ol.geom.Point(ol.proj.fromLonLat([lon,lat]))
     		})
     		
     		
     		
     		var vectorDynamic =  new ol.layer.Vector({
     			title : 'Dynamic',
     			source : new ol.source.Vector({
     				features : [mark]
     			}),
     			style: new ol.style.Style({
     		        image: new ol.style.Icon({
     		          src: 'images/mm_20_red.png'
     		        })
     		      })

     		})
     	map.addLayer(vectorDynamic);
        	 
        	 
        	 var slider = new ol.control.ZoomSlider();
        	 map.addControl(slider);
        	 
        	 var scaleline = new ol.control.ScaleLine();
        	 map.addControl(scaleline);

        	 var full_sc = new ol.control.FullScreen({
        	 	label : 'F'
        	 });
        	 map.addControl(full_sc);

        	 /* var mouse_position = new ol.control.MousePosition();
        	 map.addControl(mouse_position); */
            
        }
        
 
           </script>
</head>
 
<!-- body.onload is called once the page is loaded (call the 'init' function) -->
<body onload="init();">
<div style="width:100%; height:100%" id="map"></div>
</body>
 
</html>