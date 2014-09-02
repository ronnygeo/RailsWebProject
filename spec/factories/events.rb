# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    description "MyText"
    client nil
    subcategorization nil
    start_time "2014-09-02 22:03:03"
    end_time "2014-09-02 22:03:03"
    fee "9.99"
    dress_code "MyString"
    featured false
    keywords "MyText"
    reference_code "MyString"
    link "MyString"
    duration "MyString"
  end
end
