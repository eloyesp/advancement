require 'test_helper'
require 'advancement/adapters/yaml'

class Advancement::Adapters::YAMLTest < MiniTest::Unit::TestCase

  def setup
    @yaml = Advancement::Adapters::YAML.new <<EOF
---
- CODE: 3
  NAME: FIXED
  NOTE: 17
- CODE: 4
  NAME: RELEASE
  NOTE: 16
- CODE: 5
  NAME: RELEASE
  NOTE: 16
EOF
  end

  def test_sanity
    assert_kind_of Class, Advancement::Adapters::YAML
  end

  def test_each
    @yaml.each do |r|
      assert_includes [3, 4, 5], r["CODE"]
      assert_includes [3, 4, 5], r.code
    end
  end

  def test_first
    first = @yaml.first 2
    assert 2, first.size
  end

end

