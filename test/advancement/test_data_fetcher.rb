require 'test_helper'
require 'advancement/data_fetcher'

class DataFetcherTest < MiniTest::Unit::TestCase

  def test_sanity
    assert_kind_of Class, Advancement::DataFetcher
  end

  def test_fetch_migration_with_records
    @migration = MiniTest::Mock.new

    @data_fetcher = Advancement::DataFetcher.new migration: @migration,
      source: File.new(File.join(File.dirname(__FILE__), '..', 'test_data.yml'))
    3.times do
      @migration.expect :migrate, nil, [Advancement::Adapters::YAML::Record]
    end
    @data_fetcher.start_fetching
    @migration.verify
  end

end

