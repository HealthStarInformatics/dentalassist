class Location < ActiveRecord::Base
  belongs_to :dentistry
  has_many :user
  has_many :medicalhistory
end
