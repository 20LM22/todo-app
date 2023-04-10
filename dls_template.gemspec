# frozen_string_literal: true

require_relative "lib/dls_template/version"

Gem::Specification.new do |spec|
  spec.name = "dls_template"
  spec.version = DlsTemplate::VERSION
  spec.authors = ["Eliot Jordan", "Taylor Yamashita"]

  spec.summary = "Template for generating new DLS Rails applications."
  spec.required_ruby_version = ">= 2.6.0"
  spec.license = "Apache 2.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "rails", ">= 6.0"
  spec.add_development_dependency "standard", ">= 1.0"
end