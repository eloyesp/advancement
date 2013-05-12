require 'test_helper'
require 'advancement/test_case'

class <%= class_name %>MigrationTest < Advancement::TestCase

  def test_two_places_are_migrated
    <%= class_name %>.delete_all
    run_migration
    assert_equal 2, <%= class_name %>.count, "two records are migrated"
  end

end

