jQuery ($) ->
  $('.spending').on( 'click', '.department', -> open_next(this) )
  $('.spending').on( 'change', '.expenditure_amount', -> add_amount(this) )

  add_amount = (el) ->
    user_id = $(el).data 'user_id'
    year = $(el).data 'year'
    amount = $(el).val()
    console.log "Set amount to " + amount + " for User ID: " + user_id

  open_next = (el) ->
    $(el).children('.arrow').html('▼')
    $(el).next('ul').css('display', 'block')
