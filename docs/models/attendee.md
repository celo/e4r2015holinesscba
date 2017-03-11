## Model Schema
* event:references
* name:string
* tag_name:string
* birth_date:date
* gender:integer
* address:string
* neighborhood:string
* city:references
* cep:string
* phone:string
* cellphone:string
* email:string
* church:references
* payment_plan:references
* food_restriction:boolean
* food_restriction_notes:string
* family:text
* accomodation:references
* arrival_date:datetime
* arrival_option:string
* arrival_notes:text
* extra_notes:text

## Gender
[Reference](https://www.sitepoint.com/enumerated-types-with-activerecord-and-postgresql/)
~~~~
# app/models/user.rb
class User < ActiveRecord::Base
  enum gender: [ :male, :female, :not_sure, :prefer_not_to_disclose ]
end
~~~~
### Usage
~~~~
# mutate enum using the exclamation mark (!) method.
user.male!
user.female!
user.not_sure!
user.prefer_not_to_disclose!

# or mutate enum using value assignment
user.gender = nil
user.gender = "male"
user.gender = "female"
user.gender = "not_sure"
user.gender = "prefer_not_to_disclose"
~~~~
To retrieve the enum value:
~~~~
# retrieve enum value using the question mark (?) method
user.male?                   # => false
user.female?                 # => false
user.not_sure?               # => false
user.prefer_not_to_disclose? # => true

# or retrieve using the enum name
user.gender                  # => "prefer_not_to_disclose"
~~~~

## Family
Need to think smarter way to store the family members who will attend the event.

## Food restrictions
Need to think smarter way to store the food restrictions.

## Accomodation (formerly Hosting Preferences)
Converted in model.