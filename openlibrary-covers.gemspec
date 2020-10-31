# frozen_string_literal: true

require_relative 'lib/openlibrary/covers/version'

Gem::Specification.new do |spec|
  spec.name          = 'openlibrary-covers'
  spec.version       = Openlibrary::Covers::VERSION
  spec.authors       = ['Jane Sandberg']
  spec.email         = ['sandbej@linnbenton.edu']

  spec.summary       = 'Find cover images from openlibrary'
  spec.description   = 'A small gem that quickly checks openlibrary to see if '\
                       'a cover image exists for the identifiers you are interested in.'
  spec.homepage      = 'https://github.com/sandbergja/openlibrary-covers'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rspec-benchmark', '~> 0.6'
  spec.add_development_dependency 'rubocop', '> 0.93'
  spec.add_development_dependency 'rubocop-performance', '~> 1.8'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.44'
end
