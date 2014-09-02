class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :client, index: true
      t.references :event, index: true
      t.references :ad, index: true
      t.references :listing, index: true
      t.decimal :amount, precision: 2
      t.date :valid_from
      t.date :valid_to
      t.string :reference_code
      t.boolean :payment_received
      t.date :initial_start_date
      t.foreign_key :clients
      t.foreign_key :events
      t.foreign_key :listings
      t.foreign_key :ads
      t.timestamps
    end
  end
end
