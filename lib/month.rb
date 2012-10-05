class Month
  attr_reader :DAY_OF_WEEK
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

  MONTH_INDEX = %w[march april may june july august september october november december january february]
  MONTH_LENGTH = {:march => 31, :april => 30, :may => 31, :june => 30, :july => 31, :august => 31, :september => 30, :october => 31, :november => 30, :december => 31, :january => 31, :february => 28}
  COLUMN_SET = [7, 14, 21, 28, 35, 37]  
  DAY_OF_WEEK = "Su Mo Tu We Th Fr Sa"
  FEB = 2
  ZELLER_MONTH_OFFSET = 3
  
  #this method is a representation of zeller's congruence, as referenced in Wikipedia
  def week_start(new_year, new_month)
      day_of_month = 1 #day
      month = zeller_offset(new_month) #MONTH_INDEX.index(new_month) + 3 #months.index(new_month.DAY_OF_WEEKncase) + 3
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
    new_month = Month.new(@month, @year)
    month_string = []
    new_month.padding.times do 
      month_string << "  "
    end
    
    if @month == FEB
      (1 .. new_month.feb?(@year)).each do |i|
      month_string << space_single(i)
      end
      else
        puts zeller_offset(@month)
        puts ZELLER_MONTH_OFFSET
        puts MONTH_INDEX[zeller_offset(@month) - ZELLER_MONTH_OFFSET]
        puts MONTH_LENGTH[MONTH_INDEX[zeller_offset(@month) - ZELLER_MONTH_OFFSET].to_sym]
        (1 .. MONTH_LENGTH[(MONTH_INDEX[zeller_offset(@month)- ZELLER_MONTH_OFFSET]).to_sym]).each do |i|
        month_string << space_single(i)
        end
    end
    return month_string
  end
  
  #then parse that string out so that on every seventh one, the delimiter changes from "  " to /n
  def add_columns
    new_month = Month.new(@month, @year)
    month_array = new_month.run
    column_counter = 0
    week_counter = 0
    month_array.size > 35 ? week_Total = 6 : week_Total = 5
    weeks = []
    while week_counter < week_Total
       iterative_string = ""
       iterative_string << week_break(column_counter, week_counter, month_array)
         column_counter = COLUMN_SET[week_counter].to_i
         week_counter += 1
         weeks << iterative_string
    end #week_counter loop
    weeks 
  end #def
  
  def week_break(column_counter, week_counter, month_array)
    iterative_string = ""
    column_counter.upto(COLUMN_SET[week_counter].to_i - 1) do
      iterative_string << (column_counter + 1 < COLUMN_SET[week_counter].to_i ? month_array[column_counter].to_s + (month_array[column_counter+1] ? " " : "") : month_array[column_counter].to_s)
      column_counter += 1
    end
    iterative_string
  end
  
  def space_single(date)
    date.to_i < 10 ? " #{date}" : "#{date}"
  end
  
  def zeller_offset(input)
    input.to_i < 3 ? input.to_i + 12 : input
  end

  #turn array of weeks into a string of month
  def printout
    c = Month.new(@month, @year)
    month = c.add_columns
    my_month = ""
    my_month = (MONTH_INDEX[zeller_offset(@month)- ZELLER_MONTH_OFFSET].to_s + " " + @year.to_s).capitalize.center(20) + "\n"
    my_month << DAY_OF_WEEK + "\n"
    #my_month << month.each { |week| print week.to_s, "\n"}
    my_month << month.join("\n")
    
  end


end