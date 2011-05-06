class ChangeFields < ActiveRecord::Migration
  def self.up
    remove_column :medicalhistories, :health_level2
    remove_column :medicalhistories, :health_level3
    remove_column :medicalhistories, :health_level4
    remove_column :medicalhistories, :tobacco
    add_column :medicalhistories, :tobacco, :string
    remove_column :medicalhistories, :allergic
    add_column :medicalhistories, :allergic, :string
    remove_column :medicalhistories, :medications
    add_column :medicalhistories, :medications, :string
    remove_column :medicalhistories, :hospital_admitted
    add_column :medicalhistories, :hospital_admitted, :string
    remove_column :medicalhistories, :physicial_care
    add_column :medicalhistories, :physicial_care, :string
    remove_column :medicalhistories, :other
    add_column :medicalhistories, :other, :string
  end

  def self.down
  end
end
