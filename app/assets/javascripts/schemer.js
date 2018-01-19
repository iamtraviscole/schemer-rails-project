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

  $(document).on('click', '#newcolorschemesubmit', function(event) {
    event.preventDefault()
    createColorScheme()
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

function createColorScheme() {

  const colorScheme = $("form#new_color_scheme").serialize()

  $.ajax({
    method: "POST",
    url: $('#newcolorschemesubmit')[0].dataset.url,
    data: colorScheme,
    dataType: 'json',
    success: function(resp) {
      let partial = resp.index_partial
        $('#content').html(`<div class='container'><h1>Your Color Schemes</h1>${partial}</div>`)
      }
    })

}
