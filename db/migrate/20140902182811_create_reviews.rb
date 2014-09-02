class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true
      t.references :client, index: true
      t.references :event, index: true
      t.references :listing, index: true
      t.references :place, index: true
      t.decimal :rating
      t.text :review
      t.float :popularity
      t.foreign_key :users
      t.foreign_key :clients
      t.foreign_key :events
      t.foreign_key :listings
      t.foreign_key :places
      t.timestamps
    end
  end
end
