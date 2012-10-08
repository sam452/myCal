#!/Users/sam/.rvm/rubies/ruby-1.9.3-p0/bin/ruby
require_relative 'month'
#attr_reader :month
#attr_reader :year

class Calendar
  attr_reader :year
  
  BREAK = 3
  WEEK_SET = [7, 14, 21, 28, 35, 42]
  
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
      my_month = Month.new(number, @year)
      myArray << my_month.add_columns
    end
    return myArray
  end
  
  def printout(arra)
    month_counter = 0
    week_counter = 0
    row = ""
    
    1.upto(BREAK) do
      1.upto(7) do
        if (month_counter + 1) % BREAK != 0
          row << pad_week(arra[week_counter])
          else
          row << @year
        end
      end
    end
  end
  
  #build checker to put in padding for months that have <5 weeks
  def pad_week(week)
    puts week
    puts (20 - week.length).times {|i| print "w" }
    puts week.length
    row = ""
    pad = (20 - week.length).times do
      print " "
    end
    puts pad
    row << (week.length < 20 ? week.to_s << pad : week.to_s)
    row
  end
  
  #it should iterate for each month to leave no padding if it's the 3rd month
  
  #set method to turn arrays of first weeks into string
  
  #method to combine all together
  
  def week
    
  end
  
end

