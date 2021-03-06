class Listing < ActiveRecord::Base
  belongs_to :client
  has_many :subcategorizations
  has_many :subcategories, through: :subcategorizations
  has_one :payment
  has_many :reviews
  has_many :package_lines

  has_many :images, as: :imageable
  has_many :socials, as: :socialize

  scope :subcategory?, ->(subcategory){
    where(subcategories: {name: subcategory}).joins(:subcategories)
  }

  searchkick

end
