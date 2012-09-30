#!/Users/sam/.rvm/rubies/ruby-1.9.3-p0/bin/ruby
require_relative 'month'
#attr_reader :month
#attr_reader :year

class Calendar
  include Enumerable
  
  def initialize(month, year)
    @month = ARGV[0].chomp!.downcase!
    @year = year.chomp!.to_i
  end
  
  begin
    rescue NoMethodError => myError
      print "Be sure you have spelled the month correctly and it precedes the year", myError
  end
  
  my_month = ARGV[0].dup
  my_year = ARGV[1].dup
  @month = my_month.downcase!
  @year = my_year.to_i
  cal = Month.new(@month, @year)
  puts cal.printout

end