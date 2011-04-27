class AddWomenMedicalConditions < ActiveRecord::Migration
  def self.up
	add_column :medicalhistories, :women, :string
  end

  def self.down
  end
end
