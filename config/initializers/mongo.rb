require 'mongo'

include Mongo
mongo_client = MongoClient.new("localhost", 27017)
db = mongo_client.db("MCAAnalytics")

#puts db.collection_names
#Koala.config.api_version = "v2.1"
#@graph = Koala::Facebook::API.new('CAACEdEose0cBAEkh6cacYLuwECMBqYpeO1fwwu171Sg91wRZBrMe8u6bZBz5OEZCcHrXGd51yJFxLsYcNZBnv53vNDSTwylQIpjEMIwp0NwvjqCxJvfY8vwtRpl9CxW8JC7T5gNQ1Vbb2cWOZAZCV4pkrUkCo5PiHqIZCXJ4oMXZBDKvCkSgcAqg1qcsZBjZC3Vulm3eyfjAnWsdC9Ic7ZBMnjAstBOCk0hrZBMZD')
#feed = @graph.get_connections("168627623280401", "feed")
#feed.each {|f| puts f }


#if last_post_id still not found
#next_feed = feed.next_page
=begin

#puts db.collection_names
#c = db.collection("clients")

c.find.each do |i|
  puts i
end
=end
