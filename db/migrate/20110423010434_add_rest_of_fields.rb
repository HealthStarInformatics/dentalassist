class AddRestOfFields < ActiveRecord::Migration
  def self.up
	add_column	:medicalhistories, :spouse_name_2, :string
	add_column	:medicalhistories, :spouse_dob_2, :datetime
	add_column	:medicalhistories, :spouse_empl, :string
	add_column	:medicalhistories, :spouse_workph, :string

	add_column	:medicalhistories, :primary_name, :string
	add_column	:medicalhistories, :primary_phone, :string
	add_column	:medicalhistories, :primary_group, :string
	add_column	:medicalhistories, :primary_insured_name, :string
	add_column	:medicalhistories, :primary_insured_dob, :datetime
	add_column	:medicalhistories, :primary_relation, :string
	add_column	:medicalhistories, :primary_ssn, :string
	add_column	:medicalhistories, :primary_employer, :string

	add_column	:medicalhistories, :secondary_name, :string
	add_column	:medicalhistories, :secondary_phone, :string
	add_column	:medicalhistories, :secondary_group, :string
	add_column	:medicalhistories, :secondary_insured_name, :string
	add_column	:medicalhistories, :secondary_insured_dob, :datetime
	add_column	:medicalhistories, :secondary_relation, :string
	add_column	:medicalhistories, :secondary_ssn, :string
	add_column	:medicalhistories, :secondary_employer, :string
  end

  def self.down
  end
end
