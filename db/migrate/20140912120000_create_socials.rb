class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.string :facebook_id
      t.string :twiter_id
      t.string :google_id
      t.string :foursquare_id
      t.references :socialize, polymorphic: true
      t.timestamps
    end
  end
end
