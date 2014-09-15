class AddCostToListings < ActiveRecord::Migration
  def change
    add_column :listings, :cost, :float
  end
end
