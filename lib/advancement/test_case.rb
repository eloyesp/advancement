require 'test/unit'
class Advancement::TestCase < Test::Unit::TestCase

  # Sets the migration class to be tested.

  def self.tests migration_class
    @@migration_class = migration_class
  end

  # simulate a migration run with the fixture data

  def run_migration
    find_fixture
    migration_class.new
  end

  private

    def find_fixture
    end

    def migration_class
      @@migration_class ||= guess_migration_class_name_from_test_name
    end

    def guess_migration_class_name_from_test_name
      class_name = self.class.to_s.split("::").last.gsub /Test$/, ""
      self.class.const_get(class_name)
    end

end

