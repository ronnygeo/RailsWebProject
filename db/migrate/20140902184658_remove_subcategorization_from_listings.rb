class RemoveSubcategorizationFromListings < ActiveRecord::Migration
  def change
    remove_reference :listings, :subcategorization, index: true
  end
end
