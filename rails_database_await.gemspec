# frozen_string_literal: true

require_relative "lib/rails_database_await/version"

Gem::Specification.new do |spec|
  spec.name = "rails_database_await"
  spec.version = RailsDatabaseAwait::VERSION
  spec.authors = ["ApoEx"]
  spec.email = ["tech-lead@apoex.se"]

  spec.summary = "Await readiness of database, when using Google Cloud SQL Auth Proxy for example."
  spec.description = spec.summary
  spec.homepage = "https://github.com/apoex/rails_database_await"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "~> 3"
end
