class ChangeSubscriberBooleansToString < ActiveRecord::Migration
  def change
  	drop_table :subscribers

    create_table :subscribers do |t|
      t.string :name
      t.string :tag_name
      t.date :birth_date
      t.string :gender
      t.string :phone
      t.string :cellphone
      t.string :email
      t.references :church, index: true
      t.references :payment_plan, index: true
      t.string :food_restriction
      t.string :food_restriction_notes
      t.text :family
      t.string :hosting_preference
      t.date :arrival_date
      t.string :arrival_option
      t.text :arrival_notes
      t.text :extra_notes

      t.timestamps null: false
    end
    add_foreign_key :subscribers, :churches
    add_foreign_key :subscribers, :payment_plans
  end
end
