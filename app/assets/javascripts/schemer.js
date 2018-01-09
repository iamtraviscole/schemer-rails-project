$(function() {
  attachListeners()
})

function attachListeners(){
  $(document).on('click', '#yourschemeslink', function(event) {
    event.preventDefault()
    loadColorSchemes(this)
  })
}

function loadColorSchemes(clickData) {
  $.ajax({
    url: clickData.href,
    dataType: 'json'
  })
  .success(function(resp) {
    $('#content').html(resp.index_partial)
  })
//   $.get(clickData.href).success(function(csData) {
//     let source = $('#color-scheme-template').html()
//     let template = Handlebars.compile(source)
//     let data = {
//       colorSchemes: csData
//     }
//     let html = template(data)
//     $('#content').html(html)
//   })
}
