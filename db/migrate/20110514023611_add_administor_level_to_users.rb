class AddAdministorLevelToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :administrator, :boolean
  end

  def self.down
  end
end
