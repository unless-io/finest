//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$('#search-form').on('submit', function(){
  $('.query-form').removeClass('query-form-initial')
  $('#results').html("<div class='spinner-container'><i class='fa fa-spinner fa-pulse fa-3x fa-fw'></i></div>")
})


$('.position').on('click', function(){
  var positionValue = $(this).find('.position-number').text().trim()
  $(this).find('.position-number').replaceWith("<input class='inline-edit-position' type='text' value='" + positionValue + "'></input>")
  $('.inline-edit-position').focus()
})

$('.inline-edit-position').focusout(function() {

})