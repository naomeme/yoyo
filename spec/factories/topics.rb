# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    subject "MyString"
    name "MyString"
    body "MyText"
  end
end
