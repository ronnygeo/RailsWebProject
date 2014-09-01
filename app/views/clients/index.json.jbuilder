json.array!(@clients) do |client|
  json.extract! client, :id, :name, :description, :address, :phone, :category_id, :email, :contact_person, :website
  json.url client_url(client, format: :json)
end
