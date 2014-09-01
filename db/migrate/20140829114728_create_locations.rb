class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :lat
      t.string :long
      t.string :ip
      t.references :geolocatable, polymorphic: true
      t.timestamps
    end
  end
end
