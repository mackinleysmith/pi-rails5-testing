class GpioOutputRelayJob < ApplicationJob
  def perform(gpio_output)
    ActionCable.server.broadcast 'gpio_outputs',
      gpio_output: gpio_output# GpioOutputsController.render(partial: 'gpio_outputs/gpio_output', locals: { gpio_output: gpio_output })
  end
end