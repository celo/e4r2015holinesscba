FactoryGirl.define do
  factory :attendee do
    name "MyString"
    tag_name "MyString"
    birth_date "2017-03-11"
    gender 1
    address "MyString"
    neighborhood "MyString"
    city nil
    cep "MyString"
    phone "MyString"
    cellphone "MyString"
    email "MyString"
    church nil
    payment_plan nil
    food_restriction false
    food_restriction_notes "MyString"
    family "MyText"
    accommodation nil
    arrival_date "2017-03-11 02:06:18"
    arrival_options "MyString"
    arrival_notes "MyText"
    extra_notes "MyText"
  end
end
