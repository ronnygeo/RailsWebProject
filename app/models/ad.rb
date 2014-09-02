class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  belongs_to :client
  has_one :payment

end
