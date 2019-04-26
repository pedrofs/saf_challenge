
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "saf_challenge/version"

Gem::Specification.new do |spec|
  spec.name          = "saf_challenge"
  spec.version       = SafChallenge::VERSION
  spec.authors       = ["Pedro Fernandes Steimbruch"]
  spec.email         = ["pedrofsteimbruch@gmail.com"]

  spec.summary       = %q{CLI Challenge}

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ['saf_challenge']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
