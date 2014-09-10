class AddLogoProcessingToClients < ActiveRecord::Migration
  def change
    add_column :clients, :logo_processing, :boolean, null: false, default: false
  end
end
