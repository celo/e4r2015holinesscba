class Subscriber < ActiveRecord::Base
  belongs_to :city
  belongs_to :church
  belongs_to :payment_plan

  before_save { email.downcase! }
  validates :name, presence: true
  validates :birth_date, presence: true
  validates :gender, presence: true
  validates :address, presence: true
  validates :neighborhood, presence: true
  validates :city_name, presence: true
  validates :cep, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :church_id, presence: true
  validates :payment_plan_id, presence: true

  attr_accessor :city_name

  def city_name
    "#{self.city.name} - #{self.city.state.abbr}"
  end

end
