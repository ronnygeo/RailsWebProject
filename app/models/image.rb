class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  mount_uploader :img, ImageUploader
  process_in_background :img
end
