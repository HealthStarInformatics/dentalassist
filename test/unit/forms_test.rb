require 'test_helper'

class FormsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Forms.new.valid?
  end
end
