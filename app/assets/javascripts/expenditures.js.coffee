jQuery ($) ->
  $('.spending').on( 'click', '.department', -> open_next(this) )
  $('.spending').on( 'change', '.expenditure_amount', -> add_amount(this) )

  add_amount = (el) ->
    user_id = $(el).data 'user_id'
    year = $(el).data 'year'
    program_id = $(el).data 'program_id'
    amount = $(el).val()

    console.log "Set amount to " + amount + " for User ID: " + user_id

    $.ajax({
      type: "POST",
      url: "/expenditures.json",
      data: { expenditure: { budgetable_type: 'User', budgetable_id: user_id, amount: amount, program_id: program_id } }
    }).done( (msg) ->
      $(el).parent().append(' OK')
    )


  open_next = (el) ->
    $(el).children('.arrow').html('▼')
    $(el).next('ul').css('display', 'block')
