class CreateDentistries < ActiveRecord::Migration
  def self.up
    create_table :dentistries do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.timestamps
    end
  end

  def self.down
    drop_table :dentistries
  end
end
