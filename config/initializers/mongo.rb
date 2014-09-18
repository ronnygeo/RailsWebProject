require 'mongo'

include Mongo
mongo_client = MongoClient.new("localhost", 27017)
db = mongo_client.db("MCAAnalytics")

#puts db.collection_names
=begin
Koala.config.api_version = "v2.1"
@graph = Koala::Facebook::API.new('CAACEdEose0cBABBUwZCd7qOXg3isFLK38I6CW7KYLVtEUdu3wmlXOvKcgPTgNfOeld3vwSCmIyZAYx6aAVcQMcB4iERxH0RWyZBi4DRR0SrRPhZC4oLrAmyeZA2az2DylRBZBpDpAEJktQnrGvjosocpjydJEl3oa7qWDTWcckNrouzHQSUNQM19LvsuUCdvJ82EgIZASCgH6YM3mbji3VoylfXEY2tZBUYZD')

c = db.collection("clients").find.all? do |cl|
  puts cl
  if cl["facebook"]
    feed = @graph.get_connections("168627623280401", "feed")
    feed.each do |f|
      #puts f
    end

  end

end
=end




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




#c_hash = Oj.load(c)

#puts c_hash