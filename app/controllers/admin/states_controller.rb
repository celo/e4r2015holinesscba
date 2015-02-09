class Admin::StatesController < Admin::ApplicationController
  
  def index
    #@cities = City.order(:state_id,:name).paginate(page: params[:page])
    @states = State.all.order(:name)
  end

end
