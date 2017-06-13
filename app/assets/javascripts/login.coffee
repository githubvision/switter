# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
	$('#login-hide').css 'display', 'none'
	$('#login-box').css 'display', ''
	$('#signup-hide').css 'display', ''
	$('#signup-box').css 'display', 'none'


	$('#signup-link').on 'click', ->
	  $('#login-box').css 'display', 'none'
	  $('#signup-box').css 'display', ''
	  $('#login-hide').css 'display', ''
	  $('#signup-hide').css 'display', 'none'
	  return

	$('#login-link').on 'click', ->
	  $('#signup-box').css 'display', 'none'
	  $('#login-box').css 'display', ''
	  $('#login-hide').css 'display', 'none'
	  $('#signup-hide').css 'display', ''

	  return

	$('.swit-text-area').on 'keyup', ->
		length = $(this).val().length;
		if length > 0
			if $('.createswit-btn').hasClass('disabled')
		  		$('.createswit-btn').removeClass('disabled');
		else
			if $('.createswit-btn').hasClass('disabled') == false
		  		$('.createswit-btn').addClass('disabled');
		  	
		length = 140 - length;
		if length < 0
		  $('#swit-charcount').html '<span style="color: red;">' + length + '</span>'
		else
		  $('#swit-charcount').html length
		
		return

	$('.login-form').form({
		on: 'blur',
		fields: {
			'login[username]': {
				identifier	: 'login[username]',
				rules : [
					{
						type: 'empty',
						prompt: 'Please enter username.'
					}
				]
			},

			'login[password]': {
				identifier	: 'login[password]',
				rules : [
					{
						type: 'empty',
						prompt: 'Please enter username.'
					}
				]
			}
		}
	});