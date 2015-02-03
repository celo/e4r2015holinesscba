class ChangeStateColumnAcronymToAbbr < ActiveRecord::Migration
  def change
  	rename_column :states, :acronym, :abbr
  end
end
