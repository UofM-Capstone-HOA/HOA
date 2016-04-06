# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require materialize-sprockets
#= require underscore
#= require gmaps/google
#= require_tree .

@link_to_new_issue = () ->
	
	cur_location = navigator.geolocation.getCurrentPosition( 
		(pos) ->
			$.get(
				url: 'issues/new',
				{
				long: pos.coords.longitude, 
				lat: pos.coords.latitude
				},
				(response) ->
					document.open()
					document.write(response)
					document.close()
			)
	)

# Initialize jQuery
$(document).on('ready page:change', ->
	# ready = -> 

	#Navbar collapse load
	$(".button-collapse").sideNav()

	#Parallax scrolling load
	$('.parallax').parallax()

	# Scrollspy scrolling tracking
	$('.scrollspy').scrollSpy()

	# to make matrailize's select work
	$('select').material_select()

	# collapsable
	$('.collapsible').collapsible({accordion : false})

    # dismiss the popup
	$('.modal-trigger').leanModal({dismissible : true})
	
	# reintialize the button waves issue
	Waves.displayEffect()

	)

	



# $(document).ready(ready)
# $(document).on('page:load page:partial-load', ready)



# (function($){
# 	$(function(){
# 		#Navbar collapse load
# 		$(".button-collapse").sideNav();

# 		#Parallax scrolling load
# 		$('.parallax').parallax();

# 		# Scrollspy scrolling tracking
# 		$('.scrollspy').scrollSpy();

# 		# to make matrailize's select work
# 		$('select').material_select();
# 	}); # end of document ready
# })(jQuery); 



