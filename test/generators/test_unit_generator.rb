require 'test_helper'
require 'generators/test_unit/advancement/advancement_generator'

class TestTestUnitAdvancementGenerator < Rails::Generators::TestCase
  tests TestUnit::Generators::AdvancementGenerator
  destination File.expand_path('../tmp', File.dirname(__FILE__))
  setup :prepare_destination

  test 'generate the migration class in the advancement folder' do
    run_generator ['places']
    assert_file 'test/unit/advancement/places_migration_test.rb'
    assert_file 'test/unit/advancement/fixtures/places.yml'
  end

end
