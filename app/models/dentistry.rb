class Dentistry < ActiveRecord::Base
  attr_accessible :name, :address, :phone
  has_many :locations
end
