json.array!(@packages) do |package|
  json.extract! package, :id, :user_id, :amount, :invitees, :date, :qrcode, :recipient, :meet_time
  json.url package_url(package, format: :json)
end
