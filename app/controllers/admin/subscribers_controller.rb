class Admin::SubscribersController < Admin::ApplicationController
  before_action :find_subscriber, only: [:show, :edit, :update, :destroy]
  before_action :find_churches, only: [:index, :new, :create, :edit, :update, :list]
  before_action :find_payment_plans, only: [:index, :new, :create, :edit, :update, :list]


  def index
    @search = Subscriber.ransack(params[:q])
    @subscribers = @search.result
  end

  def show
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      flash[:info] = "Subscriber created"
      redirect_to admin_subscribers_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @subscriber.update_attributes(subscriber_params)
      flash[:success] = "Subscriber updated"
      redirect_to admin_subscribers_url
    else
      render 'edit'
    end
  end

  def destroy
    @subscriber.destroy
    flash[:success] = "Subscriber deleted"
    redirect_to admin_subscribers_url
  end

  def list
    @search = Subscriber.ransack(params[:q])
    @subscribers = @search.result
    respond_to do |format|
      format.html
      format.xls {
            response.headers['Content-Disposition'] = "attachment; filename=\"list-#{Time.zone.now.strftime("%Y-%m-%d-%H-%M-%S")}.xls\""
        }
    end
  end

  def list2
    @subscribers = Subscriber.where(food_restriction: 'S').order(:name)
    respond_to do |format|
      format.html
      format.xls {
            response.headers['Content-Disposition'] = "attachment; filename=\"list2-#{Time.zone.now.strftime("%Y-%m-%d-%H-%M-%S")}.xls\""
        }
    end
  end

  def list3
    @subscribers = Subscriber.all.order(:church_id, :name)
    respond_to do |format|
      format.html
      format.xls {
            response.headers['Content-Disposition'] = "attachment; filename=\"list3-#{Time.zone.now.strftime("%Y-%m-%d-%H-%M-%S")}.xls\""
        }
    end
  end
  private
    def find_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    def find_churches
      @churches = Church.all.order(:name)
    end

    def find_payment_plans
      @payment_plans = PaymentPlan.all.order(:name)
    end

    def subscriber_params
      params.require(:subscriber).permit(:name, :tag_name, :birth_date, :gender, :phone, :cellphone, :email, :church_id, :payment_plan_id, :food_restriction, :food_restriction_notes, :family, :hosting_preference, :extra_notes)
    end

end
