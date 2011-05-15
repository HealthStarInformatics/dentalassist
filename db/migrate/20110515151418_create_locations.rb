class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :hours
      t.integer :dentistry_id
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
