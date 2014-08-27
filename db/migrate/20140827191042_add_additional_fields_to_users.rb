class AddAdditionalFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :DateOfBirth, :date
    add_column :users, :nationality, :string
    add_column :users, :phone, :string
    add_column :users, :gender, :string
    add_column :users, :admin, :boolean
    add_column :users, :client, :boolean
    add_column :users, :role, :string
  end
end
