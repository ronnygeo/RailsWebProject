class Payment < ActiveRecord::Base
  belongs_to :client
  belongs_to :event
  belongs_to :ad
  belongs_to :listing
end
