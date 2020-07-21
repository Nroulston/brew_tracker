class CreateTimeAddeds < ActiveRecord::Migration
  def change
    create_table :time_addeds do |t|
      t.integer :time_added
      t.timestamps null: false
    end
  end
end
