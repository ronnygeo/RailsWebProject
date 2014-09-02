# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    client nil
    event nil
    ad nil
    listing nil
    amount ""
    valid_from "2014-09-02"
    valid_to "2014-09-02"
    reference_code "MyString"
    payment_received false
    initial_start_date "2014-09-02"
  end
end
