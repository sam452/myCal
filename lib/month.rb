class Month
  attr_reader :dow
  attr_reader :month
  attr_reader :year

  def initialize(month, year)
    @month = month
    @year = year
  end

#year/4 == 0 leap year
#year/100 == 0 centurial/no leap
#year/400 == 0 leap year


#Get argv working
#get start spacing working
#get new week starting after Saturday

#figure spacing for single digit
#center month & year in title

#get number of days in a month tabled out

  MONTH_INDEX = %w[x y z march april may june july august september october november december january february]
 # MONTH_INDEX = [13, 14, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  MONTH_LENGTH = {:march => 31, :april => 30, :may => 31, :june => 30, :august => 31, :september => 30, :october => 31, :november => 30, :december => 31, :january => 31, :february => 28}
  #MONTH_LENGTH = {:3 => 31, :april => 30, :may => 31, :june => 30, :august => 31, :september => 30, :october => 31, :november => 30, :december => 31, :january => 31, :february => 28}
  COLUMN_SEPARATOR = " "
  ITERATOR2 = [7, 14, 21, 28, 35, 37]  
  DOW = "Su Mo Tu We Th Fr Sa"
  FEB = 2
  
  def week_start(new_year, new_month)
      months = %w[march april may june july august september october november december january february]
      weekdays = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
      day_of_month = 1 #day
      month = zeller_offset(new_month) #MONTH_INDEX.index(new_month) + 3 #months.index(new_month.downcase) + 3
      year =  month > 12 ? new_year -1 : new_year
      march_offset = ((month + 1)* 26/10).floor
      leap_year_offset = (year/4).floor + ((year/100).floor)*6 + (year/400).floor
      day_of_week = (day_of_month + march_offset + year + leap_year_offset) %7
      #raise if months.include?(new_month) == false
     #   print "You must spell the month corectly"
      
    return day_of_week
  end

#given a month and a year, I can get the column the one starts. 
#then I can start wrapping days after that. 

#first get the string needed that will output the Calendar
#if year/4 == 0 || year/400 == 0 then feb has 29 days

  #determine if Feb has 28 or 29 days
  def feb?(year)
    if year != 1900 && year % 4 == 0 || year % 400 == 0
      29
      else
      28
    end
  end
  
  #figure a way to pad the spaces for where '1' starts
  def padding
    week_start(@year, @month)
    if week_start(@year, @month) == 0
      6
      else
      week_start(@year, @month) - 1
    end
  end

#get an array out of a month
  def run
    c = Month.new(@month, @year)
    month_string = []
    c.padding.times do 
      month_string << "  "
    end
    
    if @month == FEB
      (1 .. c.feb?(@year)).each do |i|
      month_string << space_single(i)
      end
      else
        (1 .. MONTH_LENGTH[(MONTH_INDEX[zeller_offset(@month)]).to_sym]).each do |i|
        month_string << space_single(i)
        end
    end
    return month_string
  end
  
  #get the delimiters working with "  "

#then parse that string out so that on every seventh one, the delimiter changes from "  " to /n
  def add_columns
    c = Month.new(@month, @year)
    month_array = c.run
    i = 1
    j = 0
    h = 0
    month_array.size > 35 ? week_Total = 6 : week_Total = 5
    weeks = []
    while h < week_Total
       iterative_string = ""
       while j < ITERATOR2[h].to_i 
            iterative_string << (i < ITERATOR2[h].to_i ? month_array[j].to_s + (month_array[j+1] ? " " : "") : month_array[j].to_s)
            j += 1
            i += 1
         end #while j
         h += 1
         weeks << iterative_string
    end #h loop
    weeks #a = weeks.each { |u| iterative_string << u}
  end #def
  
  def space_single(i)
    i.to_i < 10 ? " #{i}" : "#{i}"
  end
  
  def zeller_offset(input)
    input.to_i < 3 ? input.to_i + 12 : input
  end

  def printout
    c = Month.new(@month, @year)
    month = c.add_columns
    my_month = ""
    my_month = (MONTH_INDEX[zeller_offset(@month)].to_s + " " + @year.to_s).capitalize.center(20) + "\n"
    my_month << DOW + "\n"
    #my_month << month.each { |week| print week.to_s, "\n"}
    my_month << month.join("\n")
    
  end


end