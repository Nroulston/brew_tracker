class StyleColumnAddedToBrewlogs < ActiveRecord::Migration
  def change
    add_column :brew_logs, :style, :string
  end
end
