lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cronto"

Gem::Specification.new do |spec|
  spec.name          = "cronto"
  spec.version       = Cronto::VERSION
  spec.authors       = ["Marcello Barnaba"]
  spec.email         = ["vjt@openssl.it"]

  spec.summary       = %q{CRONTO image generator executable}
  spec.description   = %q{This gem contains a Java wrapper for OneSpan Image SDK that generates CRONTO images}
  spec.homepage      = "https://github.com/ifad/cronto"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake"
end
