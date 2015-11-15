$LOAD_PATH.unshift 'lib'
require "core_ext/version"

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = "core_ext"
  s.version           = CoreExt::VERSION
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "ActiveSupport's core_ext without ActiveSupport"
  s.description       = "ActiveSupport's core_ext without ActiveSupport"
  s.homepage          = "http://github.com/rpanachi/core_ext"
  s.email             = ["rpanachi@gmail.com"]
  s.authors           = [ "Rodrigo Panachi" ]
  s.license           = "MIT"

  s.files                 = Dir['README.md', 'lib/**/*']
  s.require_path          = 'lib'
  s.required_ruby_version = '>= 2.2.2'

  s.rdoc_options.concat ['--encoding',  'UTF-8']

  s.add_runtime_dependency 'i18n',       '~> 0.7'
  s.add_runtime_dependency 'json',       '~> 1.7', '>= 1.7.7'
  s.add_runtime_dependency 'tzinfo',     '~> 1.1'
  s.add_runtime_dependency 'minitest',   '~> 5.1'
  s.add_runtime_dependency 'method_source', '~> 0.8'
end
