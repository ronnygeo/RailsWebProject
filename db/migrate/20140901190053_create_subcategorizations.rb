class CreateSubcategorizations < ActiveRecord::Migration
  def change
    create_table :subcategorizations do |t|
      t.references :subcategory, index: true
      t.foreign_key :subcategories
      t.timestamps
    end
  end
end
