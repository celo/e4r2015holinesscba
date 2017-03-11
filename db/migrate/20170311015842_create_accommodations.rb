class CreateAccommodations < ActiveRecord::Migration[5.0]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.string :abbr
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
