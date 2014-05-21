ready = ->
  $('li.toggleable').click ->
    if $(this).is('.toggleable')
      $(this).toggleClass('toggleable_expanded')
      $(this).toggleClass('toggleable_collapsed')
      $(this).next('ul.toggleable').slideToggle(400)
$(document).ready(ready)
$(document).on('page:load', ready)