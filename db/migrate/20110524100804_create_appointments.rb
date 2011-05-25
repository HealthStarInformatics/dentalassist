class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.string :day
      t.datetime :time
      t.string :comments
      t.string :feedback

      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
