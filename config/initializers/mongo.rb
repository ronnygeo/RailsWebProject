require 'mongo'
=begin
include Mongo
mongo_client = MongoClient.new("localhost", 27017)
db = mongo_client.db("MCAAnalytics")

#puts db.collection_names
#c = db.collection("clients")

c.find.each do |i|
  puts i
end
=end
