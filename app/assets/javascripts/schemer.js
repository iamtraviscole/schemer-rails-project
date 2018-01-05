$(function() {
  attachListeners()
})

function attachListeners(){
  $(document).on('click', '#yourschemeslink', function(event) {
    event.preventDefault()
    loadColorSchemes()
  })
}

function loadColorSchemes() {
  let userId = $('#current-user-data')[0].dataset.currentUserId
  $.get(`/users/${userId}/color_schemes.json`, function(csData) {
    let source = $('#color-scheme-template').html()
    let template = Handlebars.compile(source)
    let context = {
      colorSchemes: csData
    }
    let html = template(context)
    $('#content').html(html)
  })
}
