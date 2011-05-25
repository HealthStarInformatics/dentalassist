require 'test_helper'

class AvailableTimesTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert AvailableTimes.new.valid?
  end
end
