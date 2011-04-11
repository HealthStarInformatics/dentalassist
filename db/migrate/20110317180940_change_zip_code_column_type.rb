class ChangeZipCodeColumnType < ActiveRecord::Migration
  def self.up
	change_column :medicalhistories, :zip, :string
  end

  def self.down
  end
end
