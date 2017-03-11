class CreatePaymentPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_plans do |t|
      t.string :name
      t.text :info
      t.string :abbr
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
