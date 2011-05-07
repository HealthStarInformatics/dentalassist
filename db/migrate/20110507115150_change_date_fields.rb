class ChangeDateFields < ActiveRecord::Migration
  def self.up
    remove_column :medicalhistories, :dob
    remove_column :medicalhistories, :resp_dob
    remove_column :medicalhistories, :spouse_dob_2
    remove_column :medicalhistories, :primary_insured_dob
    remove_column :medicalhistories, :secondary_insured_dob

    add_column :medicalhistories, :dob, :string
    add_column :medicalhistories, :resp_dob, :string
    add_column :medicalhistories, :spouse_dob_2, :string
    add_column :medicalhistories, :primary_insured_dob, :string
    add_column :medicalhistories, :secondary_insured_dob, :string
  end

  def self.down
  end
end
