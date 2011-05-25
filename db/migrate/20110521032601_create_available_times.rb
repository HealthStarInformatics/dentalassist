class CreateAvailableTimes < ActiveRecord::Migration
  def self.up
    create_table :available_times do |t|
      t.boolean :mon
      t.boolean :tue
      t.boolean :wed
      t.boolean :thur
      t.boolean :fri
      t.boolean :sat
      t.boolean :sun
      t.timestamps
    end
  end

  def self.down
    drop_table :available_times
  end
end
