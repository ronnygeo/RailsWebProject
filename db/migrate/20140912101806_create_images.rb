class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :link
      t.string :caption
      t.string :description
      t.references :imageable, polymorphic: true
      t.timestamps
    end
  end
end
