require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'rubygems/specification'

task default: :spec
desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = FileList['spec/**/*_spec.rb']
  t.rspec_opts = %w(--color)
end

