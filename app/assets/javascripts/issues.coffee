
open_mod = () ->
	$('#check_issue').openModal()

close_mod = () ->
	$('#check_issue').closeModal()

$(document).on('ready page:load', ->
    navigator.geolocation.getCurrentPosition(

        (position) ->

            data = {lat: position.coords.latitude,lng: position.coords.longitude}
            $.post('/issues/mylocation',data, (response) ->
                document.getElementById('issue_address_select').options.length = 0
                for x in response['adds']
                    console.log(x)
                    $('#issue_address_select').append($("<option></option>").attr("value", x["id"]).text(String(x["number"]).concat(x["street"])))

        
                

            )

    )

)