class CreateGpioOutputs < ActiveRecord::Migration[5.0]
  def change
    create_table :gpio_outputs do |t|
      t.integer :pin
      t.integer :value
      t.datetime :completed_at

      t.timestamps
    end
  end
end
