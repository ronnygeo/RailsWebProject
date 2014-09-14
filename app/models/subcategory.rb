class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :subcategorizations
  has_many :ads
  has_many :listings, through: :subcategorizations
  has_many :places, through: :subcategorizations
  has_many :events, through: :subcategorizations
end
