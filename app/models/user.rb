class User < ActiveRecord::Base
  acts_as_authentic  {|config| 
    config.validates_uniqueness_of_email_field_options :scope => :id
  }
  has_many :medicalhistory 
  belongs_to :location, :foreign_key => 'location_admin_id' #foreign_key
end
