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
    @adapter.each do |record|
      assert_includes [3, 4, 5], record["CODE"]
      assert_includes [3, 4, 5], record.code
    end
  end

  def test_first
    firsts = @adapter.first 2
    assert 2, firsts.size
  end

end

