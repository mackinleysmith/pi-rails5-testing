class CreateGpioInputs < ActiveRecord::Migration[5.0]
  def change
    create_table :gpio_inputs do |t|
      t.integer :pin
      t.integer :value
      t.string :mode, default: GpioInput::MODE_READ

      t.timestamps
    end
  end
end
