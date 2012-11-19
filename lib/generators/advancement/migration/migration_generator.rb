module Advancement
  module Generators

    class MigrationGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :legacy_source

      def generate_migration
        template "migration.rb", "app/advancement/#{file_name}_migration.rb"
      end

      def generate_test
        template "migration_test.rb", "test/unit/advancement/#{file_name}_migration_test.rb"
      end

      def generate_fixture
        template "fixture.yml", "test/unit/advancement/fixtures/#{file_name}.yml"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end

      protected

        def file_name
          @file_name ||= File.basename(legacy_source, File.extname(legacy_source))
        end

        def class_name
          "#{file_name}".camelize
        end

        def fixtures
          fetcher = Advancement::DataFetcher.new source: File.new(legacy_source)
          fetcher.fetch_for_fixture
        end

        def attribute_names
          fixtures.first.keys
        end

    end
  end
end

