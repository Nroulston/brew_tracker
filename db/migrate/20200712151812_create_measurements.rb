class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :measurement

      t.timestamps null: false
    end
  end
end
