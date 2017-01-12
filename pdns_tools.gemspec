require File.expand_path('../lib/pdns_tools/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "pdns_tools"
  gem.version       = PdnsTools::VERSION
  gem.summary       = %q{tools for powerdns management}
  gem.description   = %q{tools for powerdns management}
  gem.license       = "MIT"
  gem.authors       = ["Mick Gortenmulder"]
  gem.email         = "mickgortenmulder@gmail.com"
  gem.homepage      = "https://rubygems.org/gems/pdns_tools"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'mysql2', '~> 0.3.14'
  gem.add_dependency 'json', '~> 1.8.1'

  gem.add_development_dependency 'awesome_print', '~> 1.2.0'
  gem.add_development_dependency 'bundler', '~> 1.3.5'
  gem.add_development_dependency 'rake', '~> 10.1.0'
  gem.add_development_dependency 'rdoc', '~> 4.0.1'
  gem.add_development_dependency 'rspec', '~> 2.13.0'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2.4'
end
