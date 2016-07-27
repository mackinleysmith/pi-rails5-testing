class GpioInputRelayJob < ApplicationJob
  def perform(gpio_input)
    ActionCable.server.broadcast 'gpio_inputs',
      gpio_input: gpio_input
  end
end