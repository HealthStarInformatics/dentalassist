class AddPreferredName < ActiveRecord::Migration
  def self.up
    add_column :medicalhistories, :pref_name, :string
  end

  def self.down
  end
end
