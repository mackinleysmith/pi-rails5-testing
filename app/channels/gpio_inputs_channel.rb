class GpioInputsChannel < ApplicationCable::Channel

  def follow(data)
    stop_all_streams
    stream_from 'gpio_inputs'
  end

  def unfollow
    stop_all_streams
  end

  def create(attrs)
    puts "CREATE RECEIVED: #{attrs}"
    GpioInput.create! attrs.symbolize_keys.slice(:pin, :mode)
  end

end