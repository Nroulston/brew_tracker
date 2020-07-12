class CreateMeasuremennts < ActiveRecord::Migration[4.2]
  def change
    create_table :measuremennts do |t|
      t.string :measurement

      t.timestamps null: false
    end
  end
end
