class AddFeaturedToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :featured, :boolean
  end
end
