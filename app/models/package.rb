class Package < ActiveRecord::Base
  belongs_to :user
  has_many :listing_packages
  has_many :listings, through: :listing_packages
end
