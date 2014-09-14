class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.references :user, index: true
      t.decimal :amount
      t.text :invitees
      t.date :date
      t.string :qrcode
      t.string :recipient
      t.time :meet_time
      t.foreign_key :users

      t.timestamps
    end
  end
end
