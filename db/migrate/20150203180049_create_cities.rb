class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.references :state, index: true
      t.string :name

      t.timestamps null: false
    end
    add_foreign_key :cities, :states
  end
end
