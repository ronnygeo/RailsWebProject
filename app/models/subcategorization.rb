class Subcategorization < ActiveRecord::Base
  belongs_to :subcategory
  belongs_to :event
  belongs_to :listing
  belongs_to :place
end
