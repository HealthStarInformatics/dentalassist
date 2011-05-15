class Locations < ActiveRecord::Base
  attr_accessible :name, :address, :phone, :hours, :dentistry_id
  has_many :dentistry
end
