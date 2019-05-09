# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  payment.setupForm()

payment =
  setupForm: ->
    $('#new_order').submit ->
        $('input[type=submit]').attr('disabled', true)
        Stripe.card.createToken($('#new_order'), payment.handleStripeResponse)
        false

  handleStripeResponse: (status, response) ->
    if status == 200
      alert(response.id)
    else
      alert(response.error.message)