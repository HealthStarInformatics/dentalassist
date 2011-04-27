class AddPersonResponsibleForAccount < ActiveRecord::Migration
  def self.up
	add_column	:medicalhistories, :responsible_name, :string
	add_column	:medicalhistories, :resp_dob, :datetime
	add_column	:medicalhistories, :resp_relation, :datetime
	add_column	:medicalhistories, :resp_addy, :string
	add_column	:medicalhistories, :resp_city, :string
	add_column	:medicalhistories, :resp_state, :string
	add_column	:medicalhistories, :resp_zip, :string
	add_column	:medicalhistories, :resp_homeph, :string
	add_column	:medicalhistories, :resp_workph, :string
	add_column	:medicalhistories, :resp_ssn, :string
	add_column	:medicalhistories, :resp_empl, :string
	add_column	:medicalhistories, :resp_long, :string
	add_column	:medicalhistories, :resp_occupation, :string
  end

  def self.down
  end
end
