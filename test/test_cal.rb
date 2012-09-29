require 'test/unit'
require 'month'
require 'pp'

class CalendarTest < Test::Unit::TestCase

  def test_23_ARGV
    c = ::Calendar.new(May 1992)
    puts "ARGV[0] = %s" % ARGV[0]
    assert_equal("May", c.month)
    pp ARGV
  end


end