class AddingForeingKeyToUser < ActiveRecord::Migration
  def self.up
    add_column :medicalhistories, :user_id, :integer
  end

  def self.down
  end
end
