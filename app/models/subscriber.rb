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

  def age
    now = Time.now.utc
    now.year - birth_date.year - (birth_date.to_time.change(:year => now.year) > now ? 1 : 0)
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |subscriber|
        csv << subscriber.attributes.values_at(*column_names)
      end
    end
  end
end
