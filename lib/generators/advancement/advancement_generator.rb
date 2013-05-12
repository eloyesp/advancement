require 'advancement'

module Advancement
  module Generators

    class AdvancementGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :migration

      def generate_migration
        template "migration.rb.erb", "app/advancement/#{migration}_migration.rb"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end

      hook_for :test_framework

      protected

        def class_name
          migration.camelize
        end

    end
  end
end

