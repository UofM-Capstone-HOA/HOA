# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# jQuery(function($) {
# $("tr[data-link]").click(function() {
# window.location = this.dataset.link
# });
# })


open_mod = (tag) ->
	$(tag).openModal()

close_mod = (tag) ->
	$(tag).closeModal()

comp_ease = () ->
	$(this).css('height', '')

@back_no_mod = (id) ->
	$(id).parent().addClass('active')
	$(id).siblings('.collapsible-body').stop(true,false).slideDown(duration: 350, easing: "easeOutQuart", queue: false, complete: comp_ease())

@back = (tag, id) ->
	close_mod(tag)
	document.querySelector('[id^=materialize-lean-overlay]').remove()
	@back_no_mod(id)

bound = false
$(document).on('turbolinks:load', ->
	$(".clickable-row").click( ->
		unless bound
			
			data = {show_id: $(this).data("id")}
			$.get(url: $(this).data("link"), data, (response) ->
				$('body').html(response)
				)
			bound = true

	)
)





# unused code

# $('#yeild_area').html('<% render :show %>')

# open_mod( "#"+$(this).data("id"))
# $.ajax(
# 	type: "POST",
#   home_owner_show: $(this).data("id")
#   url: $(this).data("link"),

# 	success: (response) ->
# 	$(body).html(response)
#   		return false
#     		# error:(data) ->
#       # 		return false
#   	)
# par = $(this).data("id")
# 		url = $(this).data("link") 
# 		window.location = url+'?home_owner_show=' + par