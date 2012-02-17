# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ = jQuery

$ ->
  date_deces_value = $("#dossier_date_deces").attr("data-value")
  $("#dossier_date_deces").val(date_deces_value)
