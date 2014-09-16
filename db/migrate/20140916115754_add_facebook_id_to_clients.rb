class AddFacebookIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :facebook_id, :string
  end
end
