json.array!(@images) do |image|
  json.extract! image, :id, :link, :caption, :description
  json.url image_url(image, format: :json)
end
