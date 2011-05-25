class Dayavailable < ActiveRecord::Base
  has_many  :locavailability
  has_many  :locations, :through => :locavailability
end
