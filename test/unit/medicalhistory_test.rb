require 'test_helper'

class MedicalhistoryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Medicalhistory.new.valid?
  end
end
