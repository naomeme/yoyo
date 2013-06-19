# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    name "MyText"
    content "MyText"
    topic nil
  end
end
