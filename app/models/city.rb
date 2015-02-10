class City < ActiveRecord::Base
  belongs_to :state
  has_many :churches
  accepts_nested_attributes_for :churches

  validates :name, presence: true
  validates_associated :state

  def city_state
  	"#{self.name} - #{self.state.abbr}"
  end
end
