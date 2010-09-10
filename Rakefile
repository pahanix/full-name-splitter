require "rubygems"
require "spec/rake/spectask"

task :default => :spec

desc "Run all specification examples"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "spec/spec.opts"]
  t.spec_files = FileList['spec/**/*_spec.rb']
end


begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "full-name-splitter"
    gemspec.summary = "*FullNameSplitter* splits full name into first and last name considering name prefixes and initials"
    gemspec.description = ""
    gemspec.email = "trevor@trevorcreech.com"
    gemspec.homepage = "http://github.com/zedlander/full-name-splitter"
    gemspec.authors = ["Pavel Gorbokon", "Trevor Creech"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end