require "rubygems"
require "spec/rake/spectask"

task :default => :spec

desc "Run all specification examples"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "spec/spec.opts"]
  t.spec_files = FileList['spec/**/*_spec.rb']
end
