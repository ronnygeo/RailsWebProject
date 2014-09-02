# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :listing do
    name "MyString"
    description "MyText"
    client nil
    subcategorization nil
    fee "9.99"
    featured false
    keywords "MyText"
    link "MyString"
    on_package false
  end
end
