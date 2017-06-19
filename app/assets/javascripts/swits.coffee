# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
	$('.sweets-box').on 'click', ->
		if $(this).hasClass('sweetened')
		  	$(this).removeClass('sweetened');
		else
			$(this).addClass('sweetened');

		return
	$('.sweets-num').on 'click', ->
		if $(this).prevAll(".sweets-box:first").hasClass('sweetened')
		  	$(this).prevAll(".sweets-box:first").removeClass('sweetened');
		else
			$(this).prevAll(".sweets-box:first").addClass('sweetened');

		return

	$('.sours-box').on 'click', ->
		if $(this).hasClass('soured')
		  	$(this).removeClass('soured');
		else
			$(this).addClass('soured');

		return

	$('.sours-num').on 'click', ->
		if $(this).prevAll(".sours-box:first").hasClass('soured')
		  	$(this).prevAll(".sours-box:first").removeClass('soured');
		else
			$(this).prevAll(".sours-box:first").addClass('soured');

		return

	


	