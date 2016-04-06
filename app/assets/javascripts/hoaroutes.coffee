# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

buildmap = (handler,route) ->
	
	# document.getElementById("button-area").innerHTML += xml.responseXML.getElementsByTagName("coordinates")[0].nodeValue
	handler.buildMap({ internal: {id: 'geolocation'} }, () ->
  		polylines = handler.addPolylines(route, 
  			{strokeColor: "#cc00cc", strokeWeight: 4}
  			)
  		handler.bounds.extendWith(polylines)
  		handler.fitMapToBounds()
  	)

@stopWatch = () ->
	navigator.geolocation.clearWatch(cur_location)


# $("#route-page").ready( ->
$(document).on('ready page:change', ->
	
	return unless $(".hoaroutes").length > 0

	handler = Gmaps.build('Google')
	polylines = null
	$.get(
		url: 'hoaroutes/getkml'
		(response) ->
				handler.buildMap({ internal: {id: 'geolocation'} }, () ->
  					polylines = handler.addPolylines(response, 
  						{strokeColor: "#cc00cc", strokeWeight: 4}
  					)
  		
  					# console.log(polylines)
  					handler.bounds.extendWith(polylines)
  					handler.fitMapToBounds()
  				)
	)
	
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
		{ enableHighAccuracy: true, timeout: 100, maximumAge: 0 }
	)

	$(document).on 'page:before-change', ->
    	navigator.geolocation.clearWatch(cur_location)
)



