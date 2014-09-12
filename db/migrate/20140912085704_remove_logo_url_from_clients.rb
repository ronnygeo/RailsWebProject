class RemoveLogoUrlFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :logo_url, :string
  end
end
