class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.references :client, index: true
      t.references :subcategorization, index: true
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :fee, precision: 10, scale: 2
      t.string :dress_code
      t.boolean :featured
      t.text :keywords
      t.string :reference_code
      t.string :link
      t.string :duration
      t.foreign_key :clients
      t.foreign_key :subcategorizations
      t.timestamps
    end
  end
end
