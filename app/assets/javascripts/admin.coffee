# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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
	@back_no_mod(id)
