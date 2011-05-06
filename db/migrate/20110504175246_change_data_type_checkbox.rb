class ChangeDataTypeCheckbox < ActiveRecord::Migration
  def self.up
    remove_column :medicalhistories, :same_above_personal
    add_column :medicalhistories, :same_above_personal, :string
    remove_column :medicalhistories, :same_above_relation
    add_column :medicalhistories, :same_above_relation, :string
  end

  def self.down
  end
end
