class AddAbbrColumnToChurch < ActiveRecord::Migration[5.0]
  def change
    add_column :churches, :abbr, :string
  end
end
