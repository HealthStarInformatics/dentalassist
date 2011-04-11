class AddMoreFields < ActiveRecord::Migration
  def self.up
	add_column :medicalhistories, :age, :integer
  end

  def self.down
  end
end
