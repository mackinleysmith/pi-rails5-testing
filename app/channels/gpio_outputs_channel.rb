class GpioOutputsChannel < ApplicationCable::Channel

  def follow(data)
    puts "FOLLOW RECEIVED: #{data}"
    stop_all_streams
    # stream_from "messages:#{data['message_id'].to_i}:comments"
    stream_from 'gpio_outputs'
  end

  def unfollow
    puts 'UNFOLLOW RECEIVED'
    stop_all_streams
  end

  def create(attrs)
    puts "CREATE RECEIVED: #{attrs}"
    GpioOutput.create! attrs.symbolize_keys.slice(:pin, :value)
  end

end