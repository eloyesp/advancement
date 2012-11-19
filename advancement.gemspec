# -*- encoding: utf-8 -*-
require File.expand_path('../lib/advancement/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Eloy Espinaco"]
  gem.email         = ["eloyesp@gmail.com"]
  gem.description   = %q{[currently in development] Progressive application retirement with TDD}
  gem.summary       = %q{[currently in development] Advancement will help you write migrations and tests with your legacy data. Then you can retire legacy applications making possible continius integration in a phased rollout model.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "advancement"
  gem.require_paths = ["lib"]
  gem.version       = Advancement::VERSION

  gem.add_dependency "rails", "~> 3.2"

  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-minitest'
  gem.add_development_dependency 'minitest-reporters'
end
