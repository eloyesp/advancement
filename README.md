# Advancement [![Gem Version](https://badge.fury.io/rb/advancement.png)](http://badge.fury.io/rb/advancement)

Progressive application retirement with TDD.

Advancement will help you write migrations and tests with your legacy data.
Then you can retire legacy applications making possible continius integration in
a phased rollout model.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'advancement'
```

And then execute:

    $ bundle

## Usage

Generate the migration with test and fixtures

    $ rails generate advancement places.dbf
    create  app/advancement/places_migration.rb
    create  test/unit/advancement/places_migration_test.rb
    create  test/unit/advancement/fixtures/places.yml

Write some tests for the migrations:

```ruby
require 'test_helper'

class PlacesMigrationTest < Advancement::TestCase

  def test_two_places_are_migrated
    run_migration
    assert_migrated Place, :count => 2
  end

end
```

Configure this migration in `'app/advancement/places_migration.rb'`

```ruby
# places_migration.rb

class PlacesMigration < Advancement::Migration

  Constrains = [:name]

  def build_place seed
    {name: seed.id, lat: seed.latit, lng: seed.longit}
  end

end
```

Configure migrations in `'config/advancement.rb'`

```ruby
# advancement.rb

Advancement.configure do |config|
  config.encoding = "CP1252"
  config.tables = ["places.dbf"]
end
```

Then run your migrations with

    $ rake advancement:run_migrations

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

