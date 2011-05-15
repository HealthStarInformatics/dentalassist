class User < ActiveRecord::Base
  acts_as_authentic  {|config| 
    config.validates_uniqueness_of_email_field_options :scope => :id
  }
  has_many :medicalhistory #forms
end
