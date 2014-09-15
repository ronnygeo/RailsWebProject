class AddItemsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :items, :text
  end
end
