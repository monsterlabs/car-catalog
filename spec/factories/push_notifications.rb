# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :push_notification do
    type ""
    sent false
  end
end
