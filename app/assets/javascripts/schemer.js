$(function() {
  attachListeners()
})

function attachListeners(){
  $('#yourschemeslink').on('click', function(event) {
    event.preventDefault()
    console.log("clicked")
    // loadColorSchemes()
  })
}

function loadColorSchemes() {

}
