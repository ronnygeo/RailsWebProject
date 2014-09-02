json.array!(@ads) do |ad|
  json.extract! ad, :id, :name, :caption, :category_id, :subcategorization_id, :link, :position, :imagesize
  json.url ad_url(ad, format: :json)
end
