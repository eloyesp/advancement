# -*- encoding: utf-8 -*-
require File.expand_path('../lib/advancement/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Eloy Espinaco"]
  gem.email         = ["eloyesp@gmail.com"]
  gem.description   = %q{Progressive application retirement with TDD}
  gem.summary       = %q{Advancement will help you write migrations and tests with your legacy data. Then you can retire legacy applications making possible continius integration in a phased rollout model.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "advancement"
  gem.require_paths = ["lib"]
  gem.version       = Advancement::VERSION
end

