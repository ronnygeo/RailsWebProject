class MClient
  include MongoMapper::Document

  key :name, String
  key :facebook_id, String
  key :twitter_id, String
  key :last_post_id, String
  key :score, Float

  many :items
end