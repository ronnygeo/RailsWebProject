# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    user nil
    client nil
    event nil
    listing nil
    place nil
    rating "9.99"
    review "MyText"
    popularity 1.5
  end
end
