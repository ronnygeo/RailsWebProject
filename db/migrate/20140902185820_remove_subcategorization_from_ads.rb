class RemoveSubcategorizationFromAds < ActiveRecord::Migration
  def change
    remove_reference :ads, :subcategorization, index: true
  end
end
