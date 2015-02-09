module Admin::CitiesHelper

    def states_list(states)
      states.order(:name).map{ |c| [c.name, c.id] }
    end
end
