class Attendee < ApplicationRecord
  belongs_to :city
  belongs_to :church
  belongs_to :payment_plan
  belongs_to :accommodation
end
