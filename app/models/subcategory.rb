class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :subcategorization
  has_many :ads
end
