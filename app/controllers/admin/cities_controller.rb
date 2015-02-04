class Admin::CitiesController < Admin::ApplicationController
  before_action :find_city, only: [:show, :edit, :update, :destroy]
  before_action :find_states, only: [:new, :edit]
  
  def index
    @cities = City.order(:state_id,:name).paginate(page: params[:page])
  end

  def show
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      flash[:info] = "City created"
      redirect_to admin_cities_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @city.update_attributes(city_params)
      flash[:success] = "City updated"
      redirect_to admin_cities_url
    else
      render 'edit'
    end
  end

  def destroy
    @city.destroy
    flash[:success] = "City deleted"
    redirect_to admin_cities_url
  end

  private
    def find_city
      @city = City.find(params[:id])
    end

    def find_states
      @states = State.all
    end

    def city_params
      params.require(:city).permit(:name, :state_id)
    end

end
