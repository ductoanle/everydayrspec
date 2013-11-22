FactoryGirl.define do
  factory :contact do
    first_name "Ethan"
    last_name "Le"
    sequence(:email) { |n| "ethan_#{n}@viki.com"}
  end
end