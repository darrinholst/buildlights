require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "buildlights"
    gem.executables = "buildlights"
    gem.summary = %Q{build monitor that will trigger lights via x10}
    gem.email = "darrinholst@gmail.com"
    gem.homepage = "http://github.com/darrinholst/buildlights"
    gem.authors = ["Darrin Holst"]
    gem.rubyforge_project = "buildlights"
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_dependency "simple-rss", ">= 1.2"
    gem.add_dependency "hpricot", ">= 0.8.1"
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "foo #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

