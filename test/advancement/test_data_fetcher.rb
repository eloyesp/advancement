require 'test_helper'
require 'advancement/data_fetcher'

class DataFetcherTest < MiniTest::Unit::TestCase

  def setup
    @migration = MiniTest::Mock.new
    @data_fetcher = Advancement::DataFetcher.new migration: @migration,
      source: fixture_data_file
  end

  def test_sanity
    assert_kind_of Class, Advancement::DataFetcher
  end

  def test_fetch_migration_with_records
    3.times do
      @migration.expect :migrate, nil, [Advancement::Adapters::YAML::Record]
    end
    @data_fetcher.start_fetching
    @migration.verify
  end

  def test_fetch_for_fixture_creation
    records = @data_fetcher.fetch_for_fixture
    assert_equal 2, records.size, "should be 2 records as default"
    assert_kind_of Hash, records.first, "records must be ready to make YAML"
  end

end

