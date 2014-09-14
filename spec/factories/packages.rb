# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :package do
    user nil
    amount "9.99"
    invitees ""
    date "2014-09-14"
    qrcode "MyString"
    recipient "MyString"
    meet_time "2014-09-14 00:17:57"
  end
end
