require 'test_helper'
require 'advancement/test_case'

class Advancement::TestCaseTest < MiniTest::Unit::TestCase

  class PlacesMigrationTest < Advancement::TestCase
  end

  ::PlacesMigration = MiniTest::Mock.new

  def setup
    @migration = ::PlacesMigration
    @migration_test = PlacesMigrationTest.new "name"
  end

  def test_sanity
    assert_kind_of Class, Advancement::TestCase
  end

  def test_migrations_can_be_run_easy
    @migration.expect :new, @migration
    @migration_test.run_migration
    @migration.verify
  end

end

