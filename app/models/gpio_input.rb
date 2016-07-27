class GpioInput < ApplicationRecord
  MODES = [
    MODE_READ = 'read',
    MODE_WAIT = 'wait'
  ]

  after_commit { GpioInputRelayJob.perform_later(self) }

  def summary
    action = case mode
      when MODE_READ then 'Read'
      when MODE_WAIT then "Wait for #{value}"
    end
    "#{action} from pin #{pin}"
  end
end
