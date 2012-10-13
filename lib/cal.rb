#!/Users/sam/.rvm/rubies/ruby-1.9.3-p0/bin/ruby
require_relative 'month'
#attr_reader :month
#attr_reader :year

class Calendar
  attr_reader :year
  
  BREAK = 3
  WEEK_SET = [7, 14, 21, 28, 35, 42]
  SECTION = 4
  WEEK_SLOTS = 6
  MONTH_INDEX = %w[January February March April May June July August September October November December]
    
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
    calendar = ""
    section_counter = 0
    section_counter + 1.upto(SECTION) do #section of months
      month_counter = (month_counter ? month_counter : 0 )
      week_counter = 0
      1.upto(6) do #drill down into weeks of section of months
        month_counter = section_counter * BREAK
        1.upto(BREAK) do
          calendar <<pad_week((arra[month_counter][week_counter] ? arra[month_counter][week_counter] : " "))
          (month_counter + 1) % BREAK != 0 ? calendar << "  " : calendar << "\n"
          if (month_counter + 1) % BREAK != 0
          end #outer if %3
          month_counter +=1
        end # upto3 loop
        week_counter += 1
      end #upto 6 loop
      section_counter += 1
    end # upto break do loop
    puts calendar
  end #def
  
  #build checker to put in padding for months that have <5 weeks
  def pad_week(week)
    puts "#{week}"
    row = ""
    row << ((week ? week.length : 20) < 20 ? week.ljust(20) : (week ? week.to_s : "                    "))
  #  row << (week.length < 20 ? week.ljust(20) : "                    ")
  end
  
  #it should iterate for each month to leave no padding if it's the 3rd month
  
  #set method to turn arrays of first weeks into string
  
  #method to combine all together
  
  def week
    
  end
  
end

