class AddLogoToClients < ActiveRecord::Migration
  def change
    add_column :clients, :logo, :string
  end
end
