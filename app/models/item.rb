class Item
  include MongoMapper::EmbeddedDocument

  key :name, String
  key :score, String

end