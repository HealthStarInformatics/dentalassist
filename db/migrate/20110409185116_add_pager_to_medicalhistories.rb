class AddPagerToMedicalhistories < ActiveRecord::Migration
  def self.up
	add_column :medicalhistories, :pager, :string
  end

  def self.down
  end
end
