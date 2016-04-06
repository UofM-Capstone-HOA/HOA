
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


$(document).on('page:change ', ->

	return unless $("#issue-index-page").length > 0

	

	handlerAll = Gmaps.build('Google')
	handlerAll.buildMap({ internal: {id: 'all-add-maps'} }, () ->
  		markers = handlerAll.addMarkers('<%=raw @hash.to_json %>')

  		handlerAll.bounds.extendWith(markers)
  		handlerAll.fitMapToBounds()

  		)
	

	$("#all-add-maps").hide()
	)
	





