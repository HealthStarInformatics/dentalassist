class CreateLocavailabilities < ActiveRecord::Migration
  def self.up
    create_table :locavailabilities do |t|
      t.integer :location_id
      t.integer :dayavailable_id

      t.timestamps
    end
  end

  def self.down
    drop_table :locavailabilities
  end
end
