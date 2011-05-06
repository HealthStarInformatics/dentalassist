class AddSameFields < ActiveRecord::Migration
  def self.up
    add_column :medicalhistories, :same_above_personal, :boolean
    add_column :medicalhistories, :same_above_relation, :boolean
  end

  def self.down
  end
end
