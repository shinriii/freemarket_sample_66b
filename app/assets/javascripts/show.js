$(document).on('turbolinks:load', function() {
  $(".inactive:first").removeClass("inactive").addClass("active");
});