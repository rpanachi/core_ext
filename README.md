[![wercker status](https://app.wercker.com/status/5c761ef70d67c7b752d00b05972d3859/s "wercker status")](https://app.wercker.com/project/bykey/5c761ef70d67c7b752d00b05972d3859)
[![Code Climate](https://codeclimate.com/github/rpanachi/core_ext/badges/gpa.svg)](https://codeclimate.com/github/rpanachi/core_ext)

# CoreExt

Utility classes and Ruby extensions for non Rails projects.

## Philosophy

CoreExt is a reduced fork of ActiveSupport, shipping only the *core_ext* part and its minimal dependencies. Some stufft like *Autoload*, *Caching*, *Logging*, *Notifications* and other Rails related classes are left behind. It was built with a few goals in mind:

* Pick only what you need - use (or require) only the modules or classes that you need on your project, without load (and override) the entire stack.
* Embrace the magic - Patching Ruby core classes - excuse me the purists - is more productive that using tons of utils classes spread throughtout your project. And this, ActiveSupport does well.
* Don't Repeat Yourself - Rather than always implement the same core functionality on different projects, centralize and reuse it.

## Installation

If using bundler, first add 'core_ext' to your Gemfile:

```ruby
gem "core_ext"
```

And run

```ruby
bundle install
```

Otherwise simply

```ruby
gem install core_ext
```

## Usage

Loading all core extensions:

```
require "core_ext/all"
```

Cherry-picking only what you want:

```
require "core_ext/object"
require "core_ext/time"
```

## Documentation

[Active Support Core Extensions](http://guides.rubyonrails.org/active_support_core_extensions.html)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
