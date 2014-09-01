class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.text :details
      t.decimal :fees, precision: 2
      t.string :area
      t.string :kind
      t.text :activities
      t.text :keyword
      t.timestamps
    end
  end
end
