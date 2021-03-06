
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cats_to_adopt/version"

Gem::Specification.new do |spec|
  spec.name          = "cats_to_adopt"
  spec.version       = CatsToAdopt::VERSION
  spec.authors       = ["Allyson Wesman"]
  spec.email         = ["allysonwesman@gmail.com"]

  spec.summary       = %q{Lists and provides info on current cats available to adopt from NKLA's website.}
  spec.description   = %q{Created as  Ruby final project for Flatiron School's Online Web Developer pgoram. The gem scrapes No Kill LA's page on cats available to adopt now and lists them in a CLI interface. The user can choose a cat to get more information.}
  spec.homepage      = "https://github.com/allysonw/cats-to-adopt-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"

  spec.add_dependency "nokogiri"
end
