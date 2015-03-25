class Subscriber < ActiveRecord::Base
  belongs_to :church
  belongs_to :payment_plan

  before_save { email.downcase! }
  validates :name, presence: true
  validates :birth_date, presence: true
  validates :gender, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, allow_blank: true
  validates :church_id, presence: true
  validates :payment_plan_id, presence: true
  validates :food_restriction, presence: true
  validates :hosting_preference, presence: true


end
