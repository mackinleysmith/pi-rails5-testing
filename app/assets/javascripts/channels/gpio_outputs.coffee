App.gpio_outputs = App.cable.subscriptions.create 'GpioOutputsChannel',
  collection: -> $("[data-channel='gpio_outputs']")

  connected: ->
    console.log('CONNECTED')
    # FIXME: While we wait for cable subscriptions to always be finalized before sending messages
    setTimeout =>
      @followCurrentMessage()
      @installPageChangeCallback()
    , 1000

  received: (data) ->
    console.log('RECEIVED', data)
    @collection().append(data.gpio_output)

  followCurrentMessage: ->
    @perform 'follow'
#    if gpioOutput = @collection().data('gpio-output-id')
#      @perform 'follow', message_id: gpioOutput
#    else
#      @perform 'unfollow'

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.gpio_outputs.followCurrentMessage()
