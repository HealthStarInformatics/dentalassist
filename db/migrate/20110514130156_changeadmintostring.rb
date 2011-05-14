class Changeadmintostring < ActiveRecord::Migration
  def self.up
    remove_column :users, :administrator
    add_column :users, :administrator, :string
  end

  def self.down
  end
end
