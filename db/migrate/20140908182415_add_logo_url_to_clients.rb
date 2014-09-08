class AddLogoUrlToClients < ActiveRecord::Migration
  def change
    add_column :clients, :logo_url, :string
  end
end
