module Admin::CitiesHelper

    def states_list(states)
      states.sort_by { |state| state.name }.collect { |c| [c.name, c.id] }
    end
end
