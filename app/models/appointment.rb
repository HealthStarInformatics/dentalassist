class Appointment < ActiveRecord::Base
# has_many :takenappointment
#  has_many :users, :through => :takenappointment
   belongs_to :location
   belongs_to :user
end
