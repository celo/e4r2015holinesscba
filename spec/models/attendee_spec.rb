require 'rails_helper'

RSpec.describe Attendee, type: :model do
  it 'has a valid name'
  it 'has a valid birth_date'
  it 'belongs to church'
  it 'belongs to event'
  it 'belongs to payment_plan'
  it 'belongs to accommodation'
  it 'has a valid email if informed'
  it 'has a food_restriction_note if food_restriction is true'
  it 'has a valid address'
  it 'has a valid gender (male or female)'
end
