class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.references :category, index: true
      t.string :image
      t.foreign_key :categories
      t.timestamps
    end
  end
end
