require 'test_helper'
require 'advancement/data_fetcher'
class DataFetcherTest < MiniTest::Unit::TestCase
  def test_sanity
    assert_kind_of Class, Advancement::DataFetcher
  end
end

