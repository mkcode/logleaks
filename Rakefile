require "bundler/gem_tasks"
require 'rake/testtask'

desc "Run all the tests"
task :default => [:test]

desc "Run specs"
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/spec_*.rb']
end

