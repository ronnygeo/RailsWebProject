class AddTwitterIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :twitter_id, :string
  end
end
