class Admin::PaymentPlansController < Admin::ApplicationController
  before_action :find_payment_plan, only: [:edit, :update, :destroy]

  def index
    @payment_plans = PaymentPlan.all.order(:name)
  end

  def new
    @payment_plan = PaymentPlan.new
  end

  def create
    @payment_plan = PaymentPlan.new(payment_plan_params)
    if @payment_plan.save
      flash[:info] = "Payment Plan created"
      redirect_to admin_payment_plans_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @payment_plan.update_attributes(payment_plan_params)
      flash[:success] = "Payment Plan updated"
      redirect_to admin_payment_plans_url
    else
      render 'edit'
    end
  end

  def destroy
    @payment_plan.destroy
    flash[:success] = "Payment Plan deleted"
    redirect_to admin_payment_plans_url
  end

  private
    def find_payment_plan
      @payment_plan = PaymentPlan.find(params[:id])
    end
    
    def payment_plan_params
      params.require(:payment_plan).permit(:name, :abbr, :info)
    end

end
