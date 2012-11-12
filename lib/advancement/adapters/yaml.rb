module Advancement::Adapters

  # The YAML adapter is used internaly to read the fixtures for the tests, but
  # will be used to migrate from yaml.

  class YAML
    include Enumerable

    # The records cuack like active records, making easy to have a common
    # language for migrations.
    # @example Attributes can be accesed in different ways
    #   place = Record.new "PLACES-LN" => "data", "PLACES-NS" => "more data"
    #   place["PLACES-LN"] #=> "data"
    #   place.places_in    #=> "data"
    #   place[:places_in]  #=> "data"

    class Record

      def initialize record_data
        @attributes = record_data
      end

      def [](key)
        if @attributes.has_key? key
          @attributes[key]
        elsif symbolized_keys.has_key? key
          @attributes[symbolized_keys[key]]
        end
      end

      private

        def method_missing method, *args
          if symbolized_keys.include? method
            self[method]
          else
            super
          end
        end

        def symbolized_keys
          @symbolized_keys ||=
            Hash[@attributes.keys.map { |key| [symbolize_key(key), key] }]
        end

        def symbolize_key key
          key.gsub(/::/, '/')
                .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
                .gsub(/([a-z\d])([A-Z])/,'\1_\2')
                .tr('-', '_')
                .downcase.to_sym
        end
    end

    # Initialize the yaml adapter for a given source
    #
    # @param [String] yaml Source data

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

