# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-vpsa/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth', '~> 1.0'

  gem.authors       = ["Joao Paulo"]
  gem.email         = ["jpjcjbr@gmail.com"]
  gem.description   = %q{Write a gem description}
  gem.summary       = %q{Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-vpsa"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::Vpsa::VERSION

  gem.add_runtime_dependency 'omniauth-oauth2'
end
