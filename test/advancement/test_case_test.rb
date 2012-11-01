require 'test_helper'
require 'advancement/test_case'

class AdvancementTestCaseTest < MiniTest::Unit::TestCase
  def test_sanity
    assert_kind_of Class, Advancement::TestCase
  end
end

