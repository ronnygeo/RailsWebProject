class RemoveKeywordFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :keyword
  end
end
