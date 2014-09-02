class AddEventToSubcategorization < ActiveRecord::Migration
  def change
    add_reference :subcategorizations, :event, index: true
    add_foreign_key :subcategorizations, :events
  end
end
