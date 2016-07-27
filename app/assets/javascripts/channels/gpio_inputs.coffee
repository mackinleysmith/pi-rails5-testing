App.gpio_inputs = App.cable.subscriptions.create 'GpioInputsChannel',
  collection: -> $("[data-channel='gpio_inputs']")

  connected: ->
    console.log('CONNECTED')
    # FIXME: While we wait for cable subscriptions to always be finalized before sending messages
    setTimeout =>
      @followCurrentMessage()
      @installPageChangeCallback()
    , 1000

  received: (data) ->
    console.log('RECEIVED', data)
    @collection().append(data.gpio_input)

  followCurrentMessage: ->
    @perform 'follow'
#    if gpioInput = @collection().data('gpio-input-id')
#      @perform 'follow', message_id: gpioInput
#    else
#      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.gpio_inputs.followCurrentMessage()
