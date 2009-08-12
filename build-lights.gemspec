# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{build-lights}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Darrin Holst"]
  s.date = %q{2009-08-12}
  s.default_executable = %q{buildlights}
  s.email = %q{darrinholst@gmail.com}
  s.executables = ["buildlights"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/buildlights",
     "build-lights.gemspec",
     "lib/bottle_rocket.rb",
     "lib/build_lights.rb",
     "lib/ccnet_xml_scanner.rb",
     "lib/config.rb",
     "lib/feed_parser.rb",
     "lib/hudson_feed_scanner.rb",
     "lib/lights.rb",
     "lib/xml_parser.rb",
     "test/ccnet_xml_scanner_test.rb",
     "test/config_test.rb",
     "test/hudson_feed_scanner_test.rb",
     "test/lights_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/darrinholst/build-lights}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{build-lights}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{build monitor that will trigger lights via x10}
  s.test_files = [
    "test/ccnet_xml_scanner_test.rb",
     "test/config_test.rb",
     "test/hudson_feed_scanner_test.rb",
     "test/lights_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<simple-rss>, [">= 1.2"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0.8.1"])
    else
      s.add_dependency(%q<simple-rss>, [">= 1.2"])
      s.add_dependency(%q<hpricot>, [">= 0.8.1"])
    end
  else
    s.add_dependency(%q<simple-rss>, [">= 1.2"])
    s.add_dependency(%q<hpricot>, [">= 0.8.1"])
  end
end