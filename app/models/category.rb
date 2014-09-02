class Category < ActiveRecord::Base
  has_many :subcategories
  has_many :clients
  has_many :ads
end
