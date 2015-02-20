class StaticPagesController < ApplicationController
  def home
  end

  def contact
  end

  def print
		@payment_plans = PaymentPlan.all.order(:name)
		render :layout => false
  end
end
