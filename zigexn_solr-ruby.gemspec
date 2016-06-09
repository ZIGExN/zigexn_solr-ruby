# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "zigexn_solr-ruby"
  spec.version       = "0.0.1"
  spec.authors       = ["kalrover"]
  spec.email         = ["kal@zigexn.co.jp"]

  spec.summary       = %q{ZIGExN's fork of the old Apache solr-ruby}
  spec.description   = %q{ZIGExN's fork of the old Apache solr-ruby}
  spec.homepage      = "https://github.com/ZIGExN/zigexn_solr-ruby"
  spec.license       = "Apache License 2.0"

  spec.files         = Dir['LICENSE.txt', 'README.md', 'lib/**/*']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
