require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'has a valid factory'
  it 'is invalid without name'
  it 'is invalid withuot start_date'
  it 'is invalid without end_date'
  it 'is invalid if end_date is earlier than start_date'
end
