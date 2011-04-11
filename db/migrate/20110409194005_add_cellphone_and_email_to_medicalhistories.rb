class AddCellphoneAndEmailToMedicalhistories < ActiveRecord::Migration
  def self.up
	add_column :medicalhistories, :cell_phone, :string
	add_column :medicalhistories, :email, :string
  end

  def self.down
  end
end
