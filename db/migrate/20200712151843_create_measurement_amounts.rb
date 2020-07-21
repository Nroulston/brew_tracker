class CreateMeasurementAmounts < ActiveRecord::Migration
  def change
    create_table :measurement_amounts do |t|
      t.integer :measurement_amount

      t.timestamps null: false
    end
  end
end
