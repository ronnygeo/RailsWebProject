class AddKeywordsToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :keywords, :text
  end
end
