class SomeMigrationFile < ActiveRecord::Migration
  def self.up
	change_column :medicalhistories, :zip, :text
  end

  def self.down
  end
end
