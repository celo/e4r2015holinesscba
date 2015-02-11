class CreatePaymentPlans < ActiveRecord::Migration
  def change
    create_table :payment_plans do |t|
      t.string :name
      t.text :info

      t.timestamps null: false
    end
  end
end
