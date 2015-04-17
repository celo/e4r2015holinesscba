class AddAbbrColumnToPaymentPlans < ActiveRecord::Migration
  def change
  	add_column :payment_plans, :abbr, :string
  end
end
