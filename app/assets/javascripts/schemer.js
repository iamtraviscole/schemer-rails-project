class Response {
  constructor(response) {
    this.response = response
  }

  randomColorScheme() {
    return `<div class='container'>${this.response.random_partial}</div>`
  }
}

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

  $(document).on('click', '#filter', function(event) {
    sortRespByCsName(respToSort)
  })
}

let respToSort

function loadColorSchemes(clickData) {
  $.ajax({
    url: clickData.href,
    dataType: 'json',
    success: function(resp) {
      console.log(resp)
      respToSort = resp
      handlebarsTemplate(resp)
    }
  })
}

function loadRandomColorScheme(clickData) {
  $.ajax({
    url: clickData.href,
    dataType: 'json',
    success: function(resp) {
      let response = new Response(resp)
      $('#content').html(response.randomColorScheme())
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
      handlebarsTemplate(resp)
    }
  })
}

function handlebarsTemplate(resp) {
    let source = $('#color-scheme-template').html()
    let template = Handlebars.compile(source)
    let context = {
      currentUserId: $('#current-user-data')[0].dataset.currentUserId,
      user: resp
    }
    let html = template(context)
    $('#content').html(html)
}

function sortRespByCsName(resp) {
  let sorted = resp.color_schemes.sort((a, b) => a.name.localeCompare(b.name))
  let sortedObject = {
    id: resp.id,
    color_schemes: sorted
  }
  handlebarsTemplate(sortedObject)
}
