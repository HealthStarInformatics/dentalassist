class Addlocationtoavailabletimes < ActiveRecord::Migration
  def self.up
    add_column :available_times, :location_id, :integer
  end

  def self.down
  end
end
