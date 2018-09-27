
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "box_office/version"

Gem::Specification.new do |spec|
  spec.name          = "box-office-cli"
  spec.version       = BoxOffice::VERSION
  spec.authors       = ["Jason Mei"]
  spec.email         = ["jason.mei403@gmail.com"]

  spec.summary       = %q{A simple gem that provides information on last weekend's movie box office.}
  spec.homepage      = "https://github.com/jmei403/box-office-cli-gem"
  spec.license       = "MIT"

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
