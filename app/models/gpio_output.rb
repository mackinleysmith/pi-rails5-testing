class GpioOutput < ApplicationRecord
  validates_presence_of :pin, :value
  # TODO: validate inclusion of pin in available pin set.

  after_commit { GpioOutputRelayJob.perform_later(self) }

  def summary
    "Write #{value} to pin #{pin}"
  end
end
