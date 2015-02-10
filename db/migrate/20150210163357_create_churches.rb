class CreateChurches < ActiveRecord::Migration
  def change
    create_table :churches do |t|
      t.string :name
      t.references :city, index: true

      t.timestamps null: false
    end
    add_foreign_key :churches, :cities
  end
end
