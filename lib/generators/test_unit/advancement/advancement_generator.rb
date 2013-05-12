module TestUnit
  module Generators
    class AdvancementGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)
      check_class_collision suffix: "MigrationTest"

      def create_migration_files
        template 'migration_test.rb', File.join('test/unit', 'advancement', "#{file_name}_migration_test.rb")
      end

      def create_fixture_file
        template 'fixture.yml', File.join('test/unit', 'advancement', 'fixtures', "#{file_name}.yml")
      end
    end
  end
end
