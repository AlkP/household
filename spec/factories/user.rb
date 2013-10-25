require 'faker'

FactoryGirl.define do
  factory :user do |f|
    pass = Faker::Internet.password
    #f.name { Faker::Name.first_name }
    f.email { Faker::Internet.email }
    f.password pass
    f.password_confirmation pass
  end
end