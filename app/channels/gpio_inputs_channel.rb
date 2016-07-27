class GpioInputsChannel < ApplicationCable::Channel

  def follow(data)
    stop_all_streams
    stream_from 'gpio_inputs'
  end

  def unfollow
    stop_all_streams
  end

end