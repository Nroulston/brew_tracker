class ChangeHopsTableColumnTypeToForm < ActiveRecord::Migration[5.2]
  def change
    rename_column :hops, :type, :form
  end
end
