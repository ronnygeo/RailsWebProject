class MongoWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  include Mongo

#  recurrence {daily}

  def perform
    mongo_client = MongoClient.new("localhost", 27017)
    db = mongo_client.db("MCAAnalytics")
  end
end