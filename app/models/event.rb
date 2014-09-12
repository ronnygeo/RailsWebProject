class Event < ActiveRecord::Base
  belongs_to :client
  has_many :subcategorizations
  has_many :subcategories, through: :subcategorizations
  has_one :payment
  has_many :reviews

  has_many :images, as: :imageable
  has_many :socials, as: :socialize

  mount_uploader :poster, PosterUploader
  process_in_background :poster

end
