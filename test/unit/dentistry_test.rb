require 'test_helper'

class DentistryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Dentistry.new.valid?
  end
end
