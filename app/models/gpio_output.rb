class GpioOutput < ApplicationRecord
  validates_presence_of :pin, :value
  # TODO: validate inclusion of pin in available pin set.
end
