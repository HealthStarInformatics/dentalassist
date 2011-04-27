class AddMoreMedicalHistory < ActiveRecord::Migration
  def self.up
	add_column :medicalhistories, :other, :boolean
	add_column :medicalhistories, :other_yes, :string
	add_column :medicalhistories, :physicial_care, :boolean
	add_column :medicalhistories, :physicial_yes, :string
	add_column :medicalhistories, :hospital_admitted, :boolean
	add_column :medicalhistories, :hospital_yes, :string
	add_column :medicalhistories, :medications, :boolean
	add_column :medicalhistories, :medications_yes, :string
	add_column :medicalhistories, :allergic, :boolean
	add_column :medicalhistories, :allergic_yes, :string
	add_column :medicalhistories, :tobacco, :boolean
	add_column :medicalhistories, :tobacco_yes, :string
	add_column :medicalhistories, :for_women, :string

  end

  def self.down
  end
end
