class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :client
  belongs_to :event
  belongs_to :listing
  belongs_to :place
end
