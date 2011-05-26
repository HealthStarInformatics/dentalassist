class User < ActiveRecord::Base
  acts_as_authentic  {|config| 
    config.validates_uniqueness_of_email_field_options :scope => :id
  }
  has_many :medicalhistory 
  has_many :locations#, :foreign_key => 'location_admin_id' #foreign_key
#has_many :takenappointment
  has_many :appointments#, :through => :takenappointment
end
