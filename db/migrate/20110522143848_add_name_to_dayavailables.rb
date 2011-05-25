class AddNameToDayavailables < ActiveRecord::Migration
  def self.up
    add_column :dayavailables, :name, :string
  end

  def self.down
  end
end
