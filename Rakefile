task :default => [:cucumber, :reek, :rubocop]

require 'cucumber/rake/task'
Cucumber::Rake::Task.new

require 'reek/rake/task'
Reek::Rake::Task.new do |t|
  t.fail_on_error = false
  t.verbose = false
  t.ruby_opts = ['-rubygems']
  t.reek_opts = '--quiet'
  t.source_files = 'bin/bf'
end

require 'rubocop/rake_task'
Rubocop::RakeTask.new
