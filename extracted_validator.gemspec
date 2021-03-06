# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'extracted_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "extracted_validator"
  spec.version       = ExtractedValidator::VERSION
  spec.authors       = ["Sergey Gernyak"]
  spec.email         = ["sergeg1990@gmail.com"]
  spec.summary       = %q{Simple way to do validations more clear :)}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/alterego-labs/extracted_validator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rails",          ">= 3.2"

  spec.add_development_dependency "rspec",          "3.2.0"
  spec.add_development_dependency "rspec-its",      "1.2.0"
  spec.add_development_dependency "pry-nav",        "0.2.3"
  spec.add_development_dependency "codeclimate-test-reporter",        "0.4.0"
  spec.add_development_dependency "sqlite3"
end
