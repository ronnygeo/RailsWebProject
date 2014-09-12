class Social < ActiveRecord::Base
  belongs_to :socialize, polymorphic: true
end
