//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  $(".card .record_fields").on("change", ".field_type", function() {
    if ($(this).val() == "select_box") {
      $(this).closest(".card-block").find(".allowed_values").show();
    } else {
      $(this).closest(".card-block").find(".allowed_values").hide();
    }
  });
});
