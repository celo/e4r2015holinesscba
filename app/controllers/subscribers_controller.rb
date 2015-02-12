class SubscribersController < ApplicationController
  before_action :find_churches, only: [:new]
  before_action :find_payment_plans, only: [:new]

  autocomplete :city, :name, :extra_data => [:state_id], display_value: :city_state

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      flash[:info] = "Subscriber created"
      redirect_to success_url
    else
      render 'new'
    end
  end

  def success
  end

  def payment_plan_info
  	@info = 'Escolha um Plano de Pagamento'
  	payment_plan = PaymentPlan.find(params[:id]) if !params[:id].blank?
  	@info = payment_plan.info if payment_plan

  	respond_to do |format|
  		format.js { }
  	end
  end

  private
    def find_churches
      @churches = Church.all.order(:name)
    end

    def find_payment_plans
      @payment_plans = PaymentPlan.all.order(:name)
    end
    
    def subscriber_params
      params.require(:subscriber).permit(:name, :birth_date, :gender, :address, :neighborhood, :city_name, :city_id, :cep, :phone, :cellphone, :email, :church_id, :payment_plan_id, :notes)
    end

end
