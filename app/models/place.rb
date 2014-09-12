class Place < ActiveRecord::Base
  has_many :subcategorizations
  has_many :subcategories, through: :subcategorizations
  has_many :reviews

  has_many :images, as: :imageable
end
