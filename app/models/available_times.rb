class AvailableTimes < ActiveRecord::Base
  attr_accessible :mon, :tue, :wed, :thur, :fri, :sat, :sun
  belongs_to :location
end
