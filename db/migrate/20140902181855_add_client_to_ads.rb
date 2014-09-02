class AddClientToAds < ActiveRecord::Migration
  def change
    add_reference :ads, :client, index: true
    add_foreign_key :ads, :clients
  end
end
