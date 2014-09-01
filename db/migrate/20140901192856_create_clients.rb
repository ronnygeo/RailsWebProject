class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :phone
      t.references :category, index: true
      t.string :email
      t.string :contact_person
      t.string :website
      t.foreign_key :categories
      t.timestamps
    end
  end
end
