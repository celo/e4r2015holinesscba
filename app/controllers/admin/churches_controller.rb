class Admin::ChurchesController < Admin::ApplicationController
  before_action :find_church, only: [:show, :edit, :update, :destroy]
  before_action :find_cities, only: [:new, :edit]
  before_action :find_states, only: [:new, :edit]

  autocomplete :city, :name, :extra_data => [:state_id], display_value: :city_state

  def index
    @churches = Church.all.order(:name)
  end

  def new
    @church = Church.new
  end

  def create
    @church = Church.new(church_params)
    if @church.save
      flash[:info] = "Church created"
      redirect_to admin_churches_url
    else
      render 'new'
    end
  end

  def edit
    @city_name = @church.city.name + " - " + @church.city.state.abbr
  end

  def update
    if @church.update_attributes(church_params)
      flash[:success] = "Church updated"
      redirect_to admin_churches_url
    else
      render 'edit'
    end
  end

  def destroy
    @church.destroy
    flash[:success] = "Church deleted"
    redirect_to admin_churches_url
  end

  private
    def find_church
      @church = Church.find(params[:id])
    end
    
    def find_cities
      @cities = City.all.order(:name)
    end

    def find_states
      @states = State.all.order(:name)
    end

    def church_params
      params.require(:church).permit(:name, :abbr, :city_name, :city_id)
    end

end
