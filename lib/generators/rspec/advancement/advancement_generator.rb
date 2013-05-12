module Rspec
  module Generators
    class AdvancementGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)
      class_option :migration_specs, :type => :boolean, :default => true

      def generate_migration_spec
        return unless options[:migration_specs]
        template 'migration_spec.rb', File.join('spec', 'advancement', "#{file_name}_migration_spec.rb")
      end
    end
  end
end
