require 'test_helper'
require 'advancement/migration'
require 'minitest/mock'

class AdvancementMigrationTest < ActiveSupport::TestCase

  class PlacesMigration < Advancement::Migration
  end

  test "load each record from the legacy table to the bulk loader" do
    @legacy_table = MiniTest::Mock.new
    @legacy_table.expect :each, [:ok, :ok]

    @places_migration = PlacesMigration.new(:legacy_table => @legacy_table)
    @legacy_table.verify
  end
end

