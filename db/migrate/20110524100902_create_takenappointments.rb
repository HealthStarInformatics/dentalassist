class CreateTakenappointments < ActiveRecord::Migration
  def self.up
    create_table :takenappointments do |t|
      t.integer :appointment_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :takenappointments
  end
end
