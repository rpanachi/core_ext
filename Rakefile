require 'rake/testtask'

task :default => :test
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/core_ext/**/*_test.rb'
  t.warning = false
  t.verbose = true
  t.ruby_opts = ["--dev"] if defined?(JRUBY_VERSION)
end

namespace :test do
  task :isolated do
    Dir.glob("test/**/*_test.rb").all? do |file|
      puts file
      sh(Gem.ruby, '-w', '-Ilib:test', file)
    end or raise "Failures"
  end
end
