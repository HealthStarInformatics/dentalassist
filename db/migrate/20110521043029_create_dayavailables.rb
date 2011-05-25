class CreateDayavailables < ActiveRecord::Migration
  def self.up
    create_table :dayavailables do |t|
      t.string :day
      t.string :time

      t.timestamps
    end
  end

  def self.down
    drop_table :dayavailables
  end
end
