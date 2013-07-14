# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#ticket_admin_id').select2
    placeholder: "Choose assignee..."
    allowClear: true
    width: '460px'

$ ->
  $('#ticket_status_id').select2
    placeholder: "Choose assignee..."
    allowClear: true
    minimumResultsForSearch: '10'
    width: '460px'

$ ->
  $('#ticket_issue').select2
    minimumResultsForSearch: '10'
    width: '460px'