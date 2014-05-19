ready = ->
  $('li.toggleable').click ->
    $(this).next('ul.toggleable').slideToggle(400)

$(document).ready(ready)
$(document).on('page:load', ready)