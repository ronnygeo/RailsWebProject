json.array!(@socials) do |social|
  json.extract! social, :id, :facebook_id, :twiter_id, :google_id, :foursquare_id
  json.url social_url(social, format: :json)
end
