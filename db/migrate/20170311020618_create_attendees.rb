class CreateAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :tag_name
      t.date :birth_date
      t.integer :gender
      t.string :address
      t.string :neighborhood
      t.references :city, foreign_key: true
      t.string :cep
      t.string :phone
      t.string :cellphone
      t.string :email
      t.references :church, foreign_key: true
      t.references :payment_plan, foreign_key: true
      t.boolean :food_restriction
      t.string :food_restriction_notes
      t.text :family
      t.references :accommodation, foreign_key: true
      t.datetime :arrival_date
      t.string :arrival_options
      t.text :arrival_notes
      t.text :extra_notes

      t.timestamps
    end
  end
end
