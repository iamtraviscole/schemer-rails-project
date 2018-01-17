$(function() {
  attachListeners()
})

function attachListeners(){
  $(document).on('click', '#yourschemeslink', function(event) {
    event.preventDefault()
    loadColorSchemes(this)
  })

  $(document).on('click', '#randomlink', function(event) {
    event.preventDefault()
    loadRandomColorScheme(this)
  })
}

function loadColorSchemes(clickData) {
  $.ajax({
    url: clickData.href,
    dataType: 'json',
    success: function(resp) {
      let partial = resp.index_partial
        $('#content').html(`<div class='container'><h1>Your Color Schemes</h1>${partial}</div>`)
      }
  })
}

function loadRandomColorScheme(clickData) {
  $.ajax({
    url: clickData.href,
    dataType: 'json',
    success: function(resp) {
      let partial = resp.random_partial
        $('#content').html(`<div class='container'>${partial}</div>`)
      }
  })
}
