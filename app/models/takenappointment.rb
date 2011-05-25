class Takenappointment < ActiveRecord::Base
  attr_accessible :appointment_id, :user_id
  belongs_to :appointment
  belongs_to :user
end
