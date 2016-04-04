# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# success = (x, pos) ->
# 	x.innerHTML = "Latitude: " + pos.coords.latitude
# 	x.innerHTML += "<br>Longitude: " + pos.coords.longitude

# failure = (x) ->
# 	x.innerHTML += 'Error'

write_to_kml = (xml, coord) ->
    xmlDoc = xml.responseXML
    new_coord =  xmlDoc.getElementsByTagName("coordinates")[0].nodeValue+'\n'+coord
    xmlDoc.getElementsByTagName("coordinates")[0].nodeValue += new_coord

print_kml = (xml) ->
	xmlDoc = xml.responseXML
	document.getElementById("button-area").innerHTML += item.nodeValue for item in xmlDoc.getElementsByTagName("coordinates")

$(document).on('ready page:load', ->

	x = []

	cur_location = navigator.geolocation.watchPosition( 
		(pos) ->
			x.push pos.coords.longitude+','+pos.coords.latitude
			# document.getElementById("new_issue_header").innerHTML = x
			# document.getElementById("button-area").innerHTML += x
		()->
			document.getElementById("button-area").innerHTML += 'Error'
		{ enableHighAccuracy: true, timeout: 10, maximumAge: 0 }
	)

	
	# xget = new XMLHttpRequest()
	# xget.onreadystatechange = ->
	# 	if xget.readyState == 4 and xget.status == 200
	# 		write_to_kml(xget, x)
	# 		print_kml(xget)
			
	# 		xpost = new XMLHttpRequest()
	# 		xpost.open("POST", "hoaroutes/postroute", true)
	# 		xpost.send(xget)

	# # this needs to have a route in the config/routes
	# xget.open("GET", "hoaroutes/getroute", true)
	# xget.send()

	

	

	# write_to_kml(xhttp,x)

	# this needs to have a route in the config/routes
	# xhr = new XMLHttpRequest()
	# xhr.open('POST', 'handler.php', true)


 # 	myFunction = (xml) ->
 #    	var xmlDoc = xml.responseXML
 #    	x = xmlDoc.getElementsByTagName("coordinates")[0].nodeValue

 #    function myFunction(xml) {
 #    	var xmlDoc = xml.responseXML;
 #    	document.getElementById("demo").innerHTML = xmlDoc.getElementsByTagName("title").childNodes[0].nodeValue
	# }

	

)


# num = 6
# lyrics = while num -= 1
#   "#{num} little monkeys, jumping on the bed.
#     One fell out and bumped his head."