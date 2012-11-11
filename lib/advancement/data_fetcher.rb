class Advancement::DataFetcher

  # Configure a data fetcher to feed the migration with records.
  #
  # @option options [File] :source source of the data.
  # @option options [Migration] :migration migration to feed

  def initialize options = {}
    @options = options
    @source = @options.delete :source
    @migration = configure_migration @options.delete :migration
    @adapter = configure_adapter
  end

  # Start fetching records

  def start
    @adapter.each do |record|
      @migration.migrate record
    end
  end

  # Fetch some records to make a fixture.
  #
  # @param [Integer] count how much records to fetch.
  # @return [String] yaml records

  def build_fixture count = 2
    records = @adapter.first count
    records = records.map { |r| r.attributes }.to_yaml
    records
  end

  private

    def configure_adapter
      #TODO: Implement
    end

    def configure_migration migration_class
      loader = @options.delete :loader || BulkLoader.new
      @migration = @options.delete(:migration).new loader
    end

end

