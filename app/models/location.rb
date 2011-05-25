class Location < ActiveRecord::Base
  attr_accessible :day_tokens, :name, :address, :phone, :dentistry_id

  has_many :locavailability
  has_many  :dayavailables, :through => :locavailability
  belongs_to :dentistry
  has_many :user
  has_many :medicalhistory

  attr_reader :day_tokens, :days_numbers
  def day_tokens=(ids)
    self.dayavailable_ids= ids.split(",")
  end

  def days_numbers
    days = [0, 1, 2, 3, 4, 5, 6]
    self.dayavailables.collect.each do |i|
      if i.name.eql?("Sunday")
        days.delete(0)
      elsif i.name.eql?("Monday")
        days.delete(1) 
      elsif i.name.eql?("Tuesday")
        days.delete(2)
      elsif i.name.eql?("Wednesday")
        days.delete(3)
      elsif i.name.eql?("Thursday")
        days.delete(4)
      elsif i.name.eql?("Friday")
        days.delete(5)
      elsif i.name.eql?("Saturday")
        days.delete(6)
      end
    end
    return "["+days.join(",")+"]"
  end
end
