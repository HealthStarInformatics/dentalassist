class Dentistry < ActiveRecord::Base
  attr_accessible :name, :address, :phone
  belongs_to :locations
end
