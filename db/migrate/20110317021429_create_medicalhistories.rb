class CreateMedicalhistories < ActiveRecord::Migration
  def self.up
    create_table :medicalhistories do |t|
      t.string :fname
      t.string :lastname
      t.timestamps
    end
  end

  def self.down
    drop_table :medicalhistories
  end
end
