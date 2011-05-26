class AddLocationIdToAppointment < ActiveRecord::Migration
  def self.up
    add_column :appointments, :location_id, :integer
  end

  def self.down
    remove_column :appointments, :location_id
  end
end
