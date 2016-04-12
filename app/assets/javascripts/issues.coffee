
open_mod = () ->
	$('#check_issue').openModal()

close_mod = () ->
	$('#check_issue').closeModal()

@collapse = (element) ->
    $("#all-add-maps").slideUp()


@expand = (element) ->
    $("#all-add-maps").slideDown(resizeMap)


resizeMap = () ->
    google.maps.event.trigger(map, "resize");
    map.setCenter(center)


# prams is not being carried through the entire function
@build_map_all = (prams) ->
	# console.log(prams)
	# p = [prams]
	# console.log(p)
	handlerAll = Gmaps.build('Google')
	console.log(prams)
	handlerAll.buildMap({ internal: {id: 'all-add-maps'} }, () ->
  		console.log(prams)
  		markers = handlerAll.addMarkers(prams)
  		# handlerAll.bounds.extendWith(markers)
  		# handlerAll.fitMapToBounds()
  	)
	console.log(prams)
	
	# handlerAll.resetBounds()

	# $("#all-add-maps").hide()


$(document).on('ready page:load', ->

	return unless $(".issues.index").length > 0

	
	)

