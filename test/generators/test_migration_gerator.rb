require 'test_helper'
require 'generators/advancement/advancement_generator'

class TestMigrationGenerator < Rails::Generators::TestCase
  tests Advancement::Generators::AdvancementGenerator
  destination File.expand_path('../tmp', File.dirname(__FILE__))
  setup :prepare_destination

  test 'generate the migration class in the advancement folder' do
    run_generator ['places']
    assert_file 'app/advancement/places_migration.rb'
  end

end
