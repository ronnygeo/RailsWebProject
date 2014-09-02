class AddSubcategoryToAds < ActiveRecord::Migration
  def change
    add_reference :ads, :subcategory, index: true
    add_foreign_key :ads, :subcategories
  end
end
