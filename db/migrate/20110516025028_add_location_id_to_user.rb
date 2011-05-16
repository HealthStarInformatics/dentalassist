class AddLocationIdToUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :admin_id
    add_column :users, :location_admin_id, :integer
    add_column :medicalhistories, :location_id, :integer
  end

  def self.down
  end
end
