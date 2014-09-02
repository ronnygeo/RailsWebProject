class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.references :client, index: true
      t.references :subcategorization, index: true
      t.decimal :fee, precision: 2
      t.boolean :featured
      t.text :keywords
      t.string :link
      t.boolean :on_package
      t.foreign_key :clients
      t.foreign_key :subcategorizations
      t.timestamps
    end
  end
end
