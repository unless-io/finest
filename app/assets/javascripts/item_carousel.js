$(document).ready(function(){

  $('#next').on('click', function(event){
    event.preventDefault()
    var current = $(this).parent().find('.book-carousel-slice.active')
    var sliceAmount = $('.book-carousel-slice').length
    var currentIndex = $('.book-carousel-slice').index(current)

    $('.book-carousel-slice').removeClass('active').addClass('hidden')

    if (currentIndex === sliceAmount - 1) {
      $('.book-carousel-slice').eq(0).removeClass('hidden').addClass('active')
    }
    else {
      $('.book-carousel-slice').eq(currentIndex + 1).removeClass('hidden').addClass('active')
    }
  });

  $('#previous').on('click', function(event){
    event.preventDefault()
    var current = $(this).parent().find('.book-carousel-slice.active')
    var sliceAmount = $('.book-carousel-slice').length
    var currentIndex = $('.book-carousel-slice').index(current)

    $('.book-carousel-slice').removeClass('active').addClass('hidden')

    if (currentIndex === 0) {
      $('.book-carousel-slice').eq(sliceAmount - 1).removeClass('hidden').addClass('active')
    }
    else {
      $('.book-carousel-slice').eq(currentIndex - 1).removeClass('hidden').addClass('active')
    }
  });

});