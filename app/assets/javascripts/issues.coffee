
open_mod = () ->
	$('#check_issue').openModal()

close_mod = () ->
	$('#check_issue').closeModal()

$(document).on('ready page:load', ->
    navigator.geolocation.getCurrentPosition(

        (position) ->

            data = {lat: position.coords.latitude,lng: position.coords.longitude}
            $.post('/issues/mylocation',data, (response) ->
                

            )

    )

)