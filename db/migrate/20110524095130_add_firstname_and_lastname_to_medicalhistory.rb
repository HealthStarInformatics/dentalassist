class AddFirstnameAndLastnameToMedicalhistory < ActiveRecord::Migration
  def self.up
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
  end

  def self.down
    remove_column :medicalhistories, :lastname
    remove_column :medicalhistories, :firstname
  end
end
