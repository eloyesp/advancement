class Advancement::DataFetcher

  # Configure a data fetcher to feed the migration with records.
  #
  # @option options [File] :source source of the data.
  # @option options [Migration] :migration migration to feed

  def initialize options = {}
    @options = options
    @source = @options.delete :source
    @migration = @options.delete :migration
    @adapter = configure_adapter @source
  end

  # Start fetching records

  def start_fetching
    @adapter.each do |record|
      @migration.migrate record
    end
  end

  # Fetch some records to make a fixture.
  #
  # @param [Integer] count how much records to fetch.
  # @return [String] yaml records

  def fetch_for_fixture count = 2
    records = @adapter.first count
    records = records.map { |r| r.attributes }
    records
  end

  private

    def configure_adapter source
      case File.extname source
      when ".yml"
        require 'advancement/adapters/yaml'
        @adapter = Advancement::Adapters::YAML.new @source
      else
        raise "cannot handle that"
      end
    end

end

