json.array!(@reviews) do |review|
  json.extract! review, :id, :user_id, :client_id, :event_id, :listing_id, :place_id, :rating, :review, :popularity
  json.url review_url(review, format: :json)
end
