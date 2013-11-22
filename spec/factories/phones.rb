# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phone do
    association :contact
    phone {"123-555-1234"}
    phone_type 'home'
  end
end
