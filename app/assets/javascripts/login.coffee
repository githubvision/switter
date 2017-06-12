# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
	$('#signup-link').on 'click', ->
	  $('#login-box').css 'display', 'none'
	  $('#signup-box').css 'display', ''
	  return

	$('#login-link').on 'click', ->
	  $('#signup-box').css 'display', 'none'
	  $('#login-box').css 'display', ''
	  return