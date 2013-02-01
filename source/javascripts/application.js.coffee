$current = null
t = null


swap= ->
  clearTimeout t
  return unless $current
  active = $current.find('img:not(.data):not(.transparent):first')
  return unless active
  next = active.next()
  if next.size() is 0
    next = $current.find('img:not(.data):first')
  active.addClass 'transparent'
  next.removeClass 'transparent'
  t = setTimeout swap, 1500


$ ->


  $("#grid").on
    mouseenter: ->
      $current = $(this)
      swap()
    mouseleave: ->
      $current.find('img:not(.data)').addClass 'transparent'
      $current.find('img:not(.data):first').removeClass 'transparent'
      $current = null
  , ".trip"


