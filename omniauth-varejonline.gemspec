# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-varejonline/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth', '~> 1.0'

  gem.authors       = ["João Paulo", "Coyô Software"]
  gem.email         = ["jpjcjbr@gmail.com", "contato@coyo.com.br"]
  gem.description   = %q{Gem criada para facilitar a integração com as API's do Varejonline}
  gem.summary       = %q{Gem criada para facilitar a integração com as API's do Varejonline}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-varejonline"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::Varejonline::VERSION

  gem.add_runtime_dependency 'omniauth-oauth2'
end
