module Advancement::Adapters

  # The YAML adapter is used internaly to read the fixtures for the tests.

  class YAML
    include Enumerable

    class Record
      def initialize record_data
        @attributes = record_data
        symbolice_keys
      end

      def [](key)
        if @attributes.has_key? key
          @attributes[key]
        end
      end

      private

        def method_missing method, *args
          if @symboliced_keys.include? method
            @attributes[@symboliced_keys[method]]
          else
            super
          end
        end

        def symbolice_keys
          @symboliced_keys = {}
          @attributes.keys.each do |key|
            simbolized_key = key.gsub(/::/, '/')
              .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
              .gsub(/([a-z\d])([A-Z])/,'\1_\2')
              .tr('-', '_')
              .downcase.to_sym
            @symboliced_keys[simbolized_key] = key
          end
        end
    end

    # Initialize the yaml adapter for a given source

    def initialize yaml
      @data = Psych.load yaml
    end

    # Calls block once for each record in the yaml file.
    #
    # @yield [Record]

    def each
      @data.each { |record_data| yield Record.new record_data }
    end

  end

end

