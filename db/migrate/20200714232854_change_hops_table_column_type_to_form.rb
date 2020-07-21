class ChangeHopsTableColumnTypeToForm < ActiveRecord::Migration
  def change
    rename_column :hops, :type, :form
  end
end
