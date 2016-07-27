class GpioInput < ApplicationRecord
  MODES = [
    MODE_READ = 'read',
    MODE_WAIT_FOR_UP = 'wait_for_up',
    MODE_WAIT_FOR_DOWN = 'wait_for_down'
  ]

  after_commit { GpioInputRelayJob.perform_later(self) }

  def summary
    action = case mode
      when MODE_READ then 'Read'
      when MODE_WAIT_FOR_UP then 'Wait for up'
      when MODE_WAIT_FOR_DOWN then 'Wait for down'
    end
    "#{action} from pin #{pin}"
  end
end
