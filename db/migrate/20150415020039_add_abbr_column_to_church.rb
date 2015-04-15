class AddAbbrColumnToChurch < ActiveRecord::Migration
  def change
  	add_column :churches, :abbr, :string
  end
end
