class Church < ActiveRecord::Base
  belongs_to :city
  
  validates :name, presence: true, uniqueness: true
  validates :city_name, presence: true

  attr_accessor :city_name

end
