class Advancement::Migration

  # Inicializa la migración
  #
  # @param loader Loader where data will be feed.

  def initialize loader
    @loader = loader
  end

  # Load a single record to the loader

  def load *args
    @loader.load(*args)
  end

end

