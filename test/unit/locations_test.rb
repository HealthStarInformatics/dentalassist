require 'test_helper'

class LocationsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Locations.new.valid?
  end
end
