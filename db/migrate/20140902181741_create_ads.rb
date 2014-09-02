class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :name
      t.string :caption
      t.references :category, index: true
      t.references :subcategorization, index: true
      t.string :link
      t.string :position
      t.string :imagesize
      t.foreign_key :categories
      t.foreign_key :subcategorizations
      t.timestamps
    end
  end
end
