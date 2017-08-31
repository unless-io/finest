$(document).ready(function(){

  $('#get-items').on('submit', function(event){
    event.preventDefault();
    $('#results').empty()
    var query = $('#query').val();

    $.ajax({
      type: "GET",
      url: "https://www.googleapis.com/books/v1/volumes?q=" + query,
      success: function(data) {
        console.log(data);
        data.items.forEach(function(item){
          addToPage(item);
        });
      },
      error: function(jqXHR) {
        console.error(jqXHR.responseText);
      }
    });
  });


  function addToPage(item){
    var listItem = '<li>' + compileResult(item) + '</li>'
      $('#results').append(listItem)
  }

  function compileResult(item) {
    if (item) {
      return compileThumbnail(item) + compileTitle(item) + compileAuthors(item) + compilePreviewLink(item)
    }
    else {
      return "No results found"
    }
  }

  function compilePreviewLink(item) {
    return "<a href='/preview?google_api_id=" + item.id + "'>" + "Preview" + "</a>"
  }


  function compileThumbnail(item) {
    if (item.volumeInfo.imageLinks){
      return "<img src='" + item.volumeInfo.imageLinks.thumbnail + "'>"
    }
    else {
      return "<img src='/placeholder.png'>"
    }
  }

  function compileTitle(item) {
    if (item.volumeInfo.title) {
      return '<p>' + item.volumeInfo.title + '</p>'
    }
    else {
      return "No title found"
    }
  }

  function compileAuthors(item) {
    if (item.volumeInfo.authors){
      return '<p>' + item.volumeInfo.authors.join(", ") + '</p>'
    }
    else {
      return "No authors found"
    }
  }
})


