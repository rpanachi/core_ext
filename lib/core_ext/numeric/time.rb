require 'core_ext/duration'
require 'core_ext/time/calculations'
require 'core_ext/time/acts_like'
require 'core_ext/date/calculations'
require 'core_ext/date/acts_like'

class Numeric
  # Enables the use of time calculations and declarations, like 45.minutes + 2.hours + 4.years.
  #
  # These methods use Time#advance for precise date calculations when using from_now, ago, etc.
  # as well as adding or subtracting their results from a Time object. For example:
  #
  #   # equivalent to Time.current.advance(months: 1)
  #   1.month.from_now
  #
  #   # equivalent to Time.current.advance(years: 2)
  #   2.years.from_now
  #
  #   # equivalent to Time.current.advance(months: 4, years: 5)
  #   (4.months + 5.years).from_now
  def seconds
    CoreExt::Duration.new(self, [[:seconds, self]])
  end
  alias :second :seconds

  # Returns a Duration instance matching the number of minutes provided.
  #
  #   2.minutes # => 120 seconds
  def minutes
    CoreExt::Duration.new(self * 60, [[:seconds, self * 60]])
  end
  alias :minute :minutes

  # Returns a Duration instance matching the number of hours provided.
  #
  #   2.hours # => 7_200 seconds
  def hours
    CoreExt::Duration.new(self * 3600, [[:seconds, self * 3600]])
  end
  alias :hour :hours

  # Returns a Duration instance matching the number of days provided.
  #
  #   2.days # => 2 days
  def days
    CoreExt::Duration.new(self * 24.hours, [[:days, self]])
  end
  alias :day :days

  # Returns a Duration instance matching the number of weeks provided.
  #
  #   2.weeks # => 14 days
  def weeks
    CoreExt::Duration.new(self * 7.days, [[:days, self * 7]])
  end
  alias :week :weeks

  # Returns a Duration instance matching the number of fortnights provided.
  #
  #   2.fortnights # => 28 days
  def fortnights
    CoreExt::Duration.new(self * 2.weeks, [[:days, self * 14]])
  end
  alias :fortnight :fortnights

  # Returns the number of milliseconds equivalent to the seconds provided.
  # Used with the standard time durations, like 1.hour.in_milliseconds --
  # so we can feed them to JavaScript functions like getTime().
  #
  #   2.in_milliseconds # => 2_000
  def in_milliseconds
    self * 1000
  end
end
