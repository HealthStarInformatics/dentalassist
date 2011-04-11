class AddFieldsToMedicalhistories < ActiveRecord::Migration
  def self.up
	add_column	:medicalhistories, :emp, :string
	add_column  :medicalhistories, :emp_term, :string
	add_column  :medicalhistories, :emp_address, :string
	add_column  :medicalhistories, :emp_city, :string
	add_column  :medicalhistories, :emp_state, :string
	add_column  :medicalhistories, :emp_zip, :string
	add_column	:medicalhistories, :resp_name, :string
	add_column	:medicalhistories, :resp_dob, :date
	add_column	:medicalhistories, :resp_relation, :string
	add_column	:medicalhistories, :resp_add, :string
	add_column	:medicalhistories, :resp_city, :string
	add_column	:medicalhistories, :resp_state, :string
	add_column	:medicalhistories, :resp_zip, :string
	add_column	:medicalhistories, :resp_home_phone, :string
	add_column	:medicalhistories, :resp_work_phone, :string
	add_column	:medicalhistories, :resp_ssn, :string
	add_column	:medicalhistories, :resp_emp, :string
	add_column	:medicalhistories, :resp_emp_term, :string
	add_column	:medicalhistories, :resp_occupation, :string
	add_column	:medicalhistories, :spouse_dob, :date
	add_column	:medicalhistories, :spouse_emp, :string
	add_column	:medicalhistories, :spouse_work_phone, :string

  end

  def self.down
  end
end
