module Advancement::Adapters

  # The YAML adapter is used internaly to read the fixtures for the tests.

  class YAML
    include Enumerable

    class Record

      def initialize record_data
        @attributes = record_data
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

