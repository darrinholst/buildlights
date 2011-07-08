# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'buildlights/version'

Gem::Specification.new do |s|
  s.name        = "buildlights"
  s.version     = BuildLights::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Darrin Holst"]
  s.email       = ["darrinholst@gmail.com"]
  s.homepage    = "http://github.com/darrinholst/buildlights"
  s.summary     = "build monitor that will trigger lights via x10"
  s.description = "build monitor that will trigger lights via x10"

  s.rubyforge_project = "buildlights"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "hpricot", "~> 0.8"
  s.add_dependency "simple-rss", "~> 1.2"
  s.add_development_dependency "rspec", "~> 1.3"
end

