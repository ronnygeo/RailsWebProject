class Place < ActiveRecord::Base
has_many :subcategories, through: :subcategorizations
end
