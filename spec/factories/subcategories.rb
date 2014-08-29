# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subcategory do
    name "MyString"
    category_id nil
    image "MyString"
  end
end
