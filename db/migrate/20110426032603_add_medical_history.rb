class AddMedicalHistory < ActiveRecord::Migration
  def self.up
	add_column :medicalhistories, :physician_name, :string
	add_column :medicalhistories, :physician_phone, :string
	add_column :medicalhistories, :medical_conditions, :string
	
  end

  def self.down
  end
end
