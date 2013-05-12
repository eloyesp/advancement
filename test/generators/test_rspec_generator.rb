require 'test_helper'
require 'generators/rspec/advancement/advancement_generator'

class TestRspecGenerator < Rails::Generators::TestCase
  tests Rspec::Generators::AdvancementGenerator
  destination File.expand_path('../tmp', File.dirname(__FILE__))
  setup :prepare_destination

  test 'generate a spec file in the advancement folder' do
    run_generator ['places']
    assert_file 'spec/advancement/places_migration_spec.rb'
  end

end
