class State < ActiveRecord::Base
	has_many :cities
	accepts_nested_attributes_for :cities
end
