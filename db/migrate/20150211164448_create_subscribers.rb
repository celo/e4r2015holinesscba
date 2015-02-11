class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :name
      t.date :birth_date
      t.boolean :gender
      t.string :address
      t.string :neighborhood
      t.references :city, index: true
      t.string :cep
      t.string :phone
      t.string :cellphone
      t.string :email
      t.references :church, index: true
      t.references :payment_plan, index: true
      t.text :notes

      t.timestamps null: false
    end
    add_foreign_key :subscribers, :cities
    add_foreign_key :subscribers, :churches
    add_foreign_key :subscribers, :payment_plans
  end
end
