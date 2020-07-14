class CreateMeasurementQties < ActiveRecord::Migration[4.2]
  def change
    create_table :measurement_qties do |t|
      t.integer :measurement_qty

      t.timestamps null: false
    end
  end
end
