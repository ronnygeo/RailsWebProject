class Client < ActiveRecord::Base
  belongs_to :category
  has_many :events
  has_many :listings
  has_many :ads
  has_many :payments
  has_many :reviews
  has_many :socials, as: :socialize

  mount_uploader :logo, LogoUploader
  process_in_background :logo
end
