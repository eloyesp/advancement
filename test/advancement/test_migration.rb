require 'test_helper'
require 'advancement/migration'

class Advancement::MigrationTest <  MiniTest::Unit::TestCase

  def test_subclases_must_implement_migrate_record
    @migration = Advancement::Migration.new
    record = {}
    assert_raises NotImplementedError do
      @migration.migrate(record)
    end
  end

end

