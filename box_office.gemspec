
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "box_office/version"

Gem::Specification.new do |spec|
  spec.name          = "box-office-cli"
  spec.version       = BoxOffice::VERSION
  spec.authors       = ["'Jason Mei'"]
  spec.email         = ["'jason.mei403@gmail.com'"]

  spec.summary       = %q{A gem that provides information on last weekend's movie box office.}
  spec.homepage      = "https://github.com/jmei403/box-office-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "https://rubygems.org"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files        = Dir.chdir(File.expand_path('..', __FILE__)) do
  #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # end

  spec.files        = ["lib/box_office.rb", "lib/box_office/cli.rb", "lib/box_office/movie.rb", "lib/box_office/scraper.rb", "lib/box_office/version.rb"]

  spec.executables   << 'box-office'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
  spec.add_dependency "colorize"
end
