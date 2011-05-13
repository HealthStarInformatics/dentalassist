class Signatures < ActiveRecord::Migration
  def self.up
    add_column :medicalhistories, :signature, :string
    add_column :medicalhistories, :signature_date, :string
  end

  def self.down
  end
end
