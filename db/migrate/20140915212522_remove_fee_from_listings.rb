class RemoveFeeFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :fee, :decimal
  end
end
