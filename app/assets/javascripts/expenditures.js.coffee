jQuery ($) ->
  $('.spending').on( 'change', '.expenditure_amount', -> add_amount(this) )

  add_amount = (el) ->
    user_id = $(el).data 'user_id'
    year = $(el).data 'year'
    amount = $(el).val()
    console.log "Set amount to " + amount + " for User ID: " + user_id
