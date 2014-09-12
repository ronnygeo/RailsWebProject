class Listing < ActiveRecord::Base
  belongs_to :client
  has_many :subcategorizations
  has_many :subcategories, through: :subcategorizations
  has_one :payment
  has_many :reviews

  has_many :images, as: :imageable

  searchkick
end
