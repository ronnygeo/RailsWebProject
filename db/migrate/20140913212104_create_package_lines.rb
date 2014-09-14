class CreatePackageLines < ActiveRecord::Migration
  def change
    create_table :package_lines do |t|
      t.references :package, index: true
      t.references :listing, index: true
      t.time :time
      t.foreign_key :packages
      t.foreign_key :listings

      t.timestamps
    end
  end
end
