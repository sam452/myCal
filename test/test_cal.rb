require 'test/unit'
require 'month'
require 'pp'

class CalendarTest < Test::Unit::TestCase

  def setup
    @month = ARGV[0]
    @year = ARGV[1]
    puts @month
  end
  
  def test_23_ARGV
    #c = Month.new("May" 1992)
    #assert_equal("May", c.month)
    pp ARGV
  end


end