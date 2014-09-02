json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :description, :client_id, :subcategorization_id, :fee, :featured, :keywords, :link, :on_package
  json.url listing_url(listing, format: :json)
end
