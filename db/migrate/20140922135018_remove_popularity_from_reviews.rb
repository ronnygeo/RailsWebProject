class RemovePopularityFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :popularity, :float
  end
end
