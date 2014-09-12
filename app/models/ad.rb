class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  belongs_to :client
  has_one :payment

  mount_uploader :image, AdUploader
  process_in_background :image
end
