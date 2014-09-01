class Location < ActiveRecord::Base
  belongs_to :geolocatable, polymorphic: true
end
