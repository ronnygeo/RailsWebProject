# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    name "MyString"
    description "MyText"
    address "MyString"
    phone "MyString"
    category nil
    email "MyString"
    contact_person "MyString"
    website "MyString"
  end
end
