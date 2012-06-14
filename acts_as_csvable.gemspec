# -*- encoding: utf-8 -*-
require File.expand_path('../lib/acts_as_csvable/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Peter Leonhardt"]
  gem.email         = ["peterleonhardt@gmail.com"]
  gem.description   = %q{A Rails plugin for easy export/import of ActiveRecord Models with CSV}
  gem.summary       = %q{This plugin allows you to export and import ActiveRecord objects via CSV, along with proving support for responding to the CSV format (via URL).}
  gem.homepage      = "https://github.com/pjleonhardt/ActsAsCSVable"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "acts_as_csvable"
  gem.require_paths = ["lib"]
  gem.version       = ActsAsCSVable::Version::STRING

  gem.add_dependency "rails"
end
