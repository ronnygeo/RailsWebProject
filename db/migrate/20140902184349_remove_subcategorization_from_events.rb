class RemoveSubcategorizationFromEvents < ActiveRecord::Migration
  def change
    remove_reference :events, :subcategorization, index: true
  end
end
