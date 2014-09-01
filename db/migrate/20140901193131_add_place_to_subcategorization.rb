class AddPlaceToSubcategorization < ActiveRecord::Migration
  def change
    add_reference :subcategorizations, :place, index: true
    add_foreign_key :subcategorizations, :places
  end
end
