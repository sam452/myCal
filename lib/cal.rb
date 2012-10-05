#!/Users/sam/.rvm/rubies/ruby-1.9.3-p0/bin/ruby
require_relative 'month'
#attr_reader :month
#attr_reader :year

class Calendar
  attr_reader :year
  
  def initialize(year)
    @year = year.to_i
  end
  
  begin
    rescue NoMethodError => myError
      print "Be sure you have spelled the month correctly and it precedes the year", myError
  end
  
    #first build array of a year of months
  def build_year
    myArray = []
    1.upto(12).each do |number| 
      puts "BUILDING MONTH: #{number}"
      my_month = Month.new(number, @year)
      myArray << my_month.add_columns
    end
  end
  
  #build checker to put in padding for months that have <5 weeks
  #it should iterate for each month to leave no padding if it's the 3rd month
  
  #set method to turn arrays of first weeks into string
  
  #method to combine all together
  
  def week
    
  end
  
  def print
    
  end

end

