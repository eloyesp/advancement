require 'advancement'

module Advancement
  module Generators

    class MigrationGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :migration

      def generate_migration
        template "migration.rb.erb", "app/advancement/#{migration}_migration.rb"
      end

      def generate_test
        template "migration_test.rb.erb", "test/unit/advancement/#{migration}_migration_test.rb"
      end

      def generate_fixture
        template "fixture.yml", "test/unit/advancement/fixtures/#{migration}.yml"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end

      protected

        def class_name
          migration.camelize
        end

    end
  end
end

