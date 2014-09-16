class CreateListingPackages < ActiveRecord::Migration
  def change
    create_table :listing_packages do |t|
      t.references :listing, index: true
      t.references :package, index: true
      t.foreign_key :listings
      t.foreign_key :packages
      t.timestamps
    end
  end
end
