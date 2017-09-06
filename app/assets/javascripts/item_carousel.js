$(document).ready(function(){

  $('#next').on('click', function(event){
    event.preventDefault()
    $('.book-carousel-slice').addClass('hidden')
    $(this).next.removeClass('hidden')
  });

  $('#previous').on('click', function(event){
    event.preventDefault()
    $('.book-carousel-slice').addClass('hidden')
    var current = $(this).parent().find('.active')
    console.log(current)
    // $(current).previous.removeClass('hidden').addClass('active')
    // $(current).removeClass('active')
  });

});