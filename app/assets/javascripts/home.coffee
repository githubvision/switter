# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
	$('.show-comments').on 'click', ->
		console.log("i'm the onneee");
		console.log($(this).data("id"))
		console.log($(this).data("swit"))

	
		return