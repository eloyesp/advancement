require 'test_helper'
require 'advancement/adapters/yaml'

class Advancement::Adapters::YamlTest < MiniTest::Unit::TestCase

  def setup
    @adapter = Advancement::Adapters::YAML.new fixture_data_file.read
  end

  def test_sanity
    assert_kind_of Class, Advancement::Adapters::YAML
  end

  def test_each
    @adapter.each do |r|
      assert_includes [3, 4, 5], r["CODE"]
      assert_includes [3, 4, 5], r.code
    end
  end

  def test_first
    first = @adapter.first 2
    assert 2, first.size
  end

end

