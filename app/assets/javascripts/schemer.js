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
    console.log(csData)
  })
}
