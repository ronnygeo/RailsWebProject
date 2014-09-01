class AddLocationToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :geolocatable, index: true
  end
end
