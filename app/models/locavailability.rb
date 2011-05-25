class Locavailability < ActiveRecord::Base
  attr_accessible :dayavailable_id, :location_id
  belongs_to :dayavailable
  belongs_to :location
end
