require 'test_helper'

module Advancement::AdapterInterfaceTest

  def test_each
    assert_respond_to @adapter, :each
  end

  def test_first
    assert_respond_to @adapter, :first
    firsts = @adapter.first 2
    assert 2, firsts.size
  end

end

