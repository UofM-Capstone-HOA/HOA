# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# success = (x, pos) ->
# 	x.innerHTML = "Latitude: " + pos.coords.latitude
# 	x.innerHTML += "<br>Longitude: " + pos.coords.longitude

# failure = (x) ->
# 	x.innerHTML += 'Error'

# write_to_kml = (xml, coord) ->
#     xmlDoc = xml.responseXML
#     new_coord =  xmlDoc.getElementsByTagName("coordinates")[0].nodeValue+'\n'+coord
#     xmlDoc.getElementsByTagName("coordinates")[0].nodeValue += new_coord

# print_kml = (xml) ->
# 	xmlDoc = xml.responseXML
# 	document.getElementById("button-area").innerHTML += item.nodeValue for item in xmlDoc.getElementsByTagName("coordinates")

buildmap = (handler,route) ->
	
	# document.getElementById("button-area").innerHTML += xml.responseXML.getElementsByTagName("coordinates")[0].nodeValue
	handler.buildMap({ internal: {id: 'geolocation'} }, () ->
  		polylines = handler.addPolylines(route, 
  			{strokeColor: "#cc00cc", strokeWeight: 4}
  			)
  		# navigator.geolocation.getCurrentPosition(
  		# 	(pos) ->
				# handler.map.centerOn({lat: pos.coords.latitude, lng: pos.coords.longitude})
  		# )
  		handler.bounds.extendWith(polylines)
  		handler.fitMapToBounds()
  	)

		
	
	# myParser = new geoXML3.parser({map: handler})
	# myParser.parse(xml.responseXML)


$(document).on('ready ["#route-page"]', ->

	handler = Gmaps.build('Google')
	polylines = null
	$.get(
		url: 'hoaroutes/getkml'
		(response) ->
				handler.buildMap({ internal: {id: 'geolocation'} }, () ->
  					polylines = handler.addPolylines(response, 
  						{strokeColor: "#cc00cc", strokeWeight: 4}
  					)
  		
  					console.log(polylines)
  					handler.bounds.extendWith(polylines)
  					handler.fitMapToBounds()
  				)
	)
		
	x = 0

	cur_location = navigator.geolocation.watchPosition( 
		(pos) ->
			data =  {hoaroute: {
				long: pos.coords.longitude, lat: pos.coords.latitude}
				}
			# console.log(polylines[0]['serviceObject'].getPath())
			polylines[0]['serviceObject'].getPath().push(new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude))
			$.post(url: 'hoaroutes/postroute', data, (response) ->
				response
			)
		()->
			document.getElementById("button-area").innerHTML += 'Error'
		{ enableHighAccuracy: true, timeout: 100, maximumAge: 0 }
	)


)

