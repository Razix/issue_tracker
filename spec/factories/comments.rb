# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    reply "MyText"
    ticket nil
    admin nil
  end
end
