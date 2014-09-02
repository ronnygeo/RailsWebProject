class AddListingToSubcategorization < ActiveRecord::Migration
  def change
    add_reference :subcategorizations, :listing, index: true
    add_foreign_key :subcategorizations, :listings
  end
end
