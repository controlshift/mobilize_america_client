# frozen_string_literal: true
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'mobilize_america_client/client'

Gem::Specification.new do |s|
  s.name = "mobilize-america-client".freeze
  s.version = MobilizeAmericaClient::Client::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Grey Moore", "Nathan Woodhull"].freeze
  s.date = "2023-03-02"
  s.email = ["grey@controlshiftlabs.com", 'nathan@daisychain.app'].freeze
  s.executables = ["console".freeze, "setup".freeze]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  s.homepage = "http://github.com/controlshift/mobilize_america_client".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.3".freeze
  s.summary = "Client gem for the MobilizeAmerica API".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<faraday>.freeze, ["> 0.15"])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  s.add_development_dependency(%q<juwelier>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
  s.add_development_dependency(%q<dotenv>.freeze, [">= 0"])
  s.add_development_dependency(%q<byebug>.freeze, [">= 0"])
end

