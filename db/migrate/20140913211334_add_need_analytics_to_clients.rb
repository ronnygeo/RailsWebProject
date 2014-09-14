class AddNeedAnalyticsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :need_analytics, :boolean
  end
end
