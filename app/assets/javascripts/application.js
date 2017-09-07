//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$('#search-form').on('submit', function(){
  $('.query-form').removeClass('query-form-initial')
  $('#results').html("<div class='spinner-container'><i class='fa fa-spinner fa-pulse fa-3x fa-fw'></i></div>")
})