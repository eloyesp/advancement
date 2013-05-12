require 'test_helper'

class TestMigrationGenerator <Rails::Generators::TestCase
  tests Advancement::Generators::MigrationGenerator
  destination File.expand_path('../tmp', File.dirname(__FILE__))
  setup :prepare_destination

  test 'generate the migration class in the advancement folder' do
    run_generator ['places']
    assert_file 'app/advancement/places_migration.rb'
    assert_file 'test/unit/advancement/places_migration_test.rb'
    assert_file 'test/unit/advancement/fixtures/places.yml'
  end

end
