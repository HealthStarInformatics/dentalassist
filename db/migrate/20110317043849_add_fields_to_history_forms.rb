class AddFieldsToHistoryForms < ActiveRecord::Migration
  def self.up
	add_column :medicalhistories, :middle_name, :string
	add_column :medicalhistories, :home_phone, :string
	add_column :medicalhistories, :biss_phone, :string
	add_column :medicalhistories, :address, :string
	add_column :medicalhistories, :city, :string
	add_column :medicalhistories, :state, :string
	add_column :medicalhistories, :zip, :integer
	add_column :medicalhistories, :occupation, :string
	add_column :medicalhistories, :ssn, :string
	add_column :medicalhistories, :dob, :datetime
	add_column :medicalhistories, :sex, :string
	add_column :medicalhistories, :height, :string
	add_column :medicalhistories, :weight, :integer
	add_column :medicalhistories, :marital, :string
	add_column :medicalhistories, :spouse_name, :string
	add_column :medicalhistories, :closest_relative, :string
	add_column :medicalhistories, :closest_relative_phone, :string
	add_column :medicalhistories, :relation_to_other_person, :string
	add_column :medicalhistories, :refered_by :string
  end

  def self.down
  end
end
