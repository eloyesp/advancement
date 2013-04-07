require 'test_helper'
require 'advancement/adapters/yaml'
require 'advancement/adapter_interface'

class Advancement::Adapters::YamlTest < MiniTest::Unit::TestCase
  include Advancement::AdapterInterfaceTest

  def setup
    @adapter = Advancement::Adapters::YAML.new fixture_data_file.read
  end

  def test_data_taken_from_yaml
    assert_equal 3, @adapter.first.code
  end

end

