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

  MONTH_LENGTH = {:march => 31, :april => 30, :may => 31, :june => 30, :august => 31, :september => 30, :october => 31, :november => 30, :december => 31, :january => 31, :february => 28}
  COLUMN_SEPARATOR = " "
  ITERATOR = [100, 80, 60, 40, 20]
  ITERATOR2 = [7, 14, 21, 28, 31]
  WEEK_TOTAL = 5
  
  def week_start(new_year, new_month)
      months = %w[march april may june july august september october november december january february]
      weekdays = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
      day_of_month = 1 #day
      month = months.index(new_month.downcase) + 3
      year =  month > 12 ? new_year -1 : new_year
      march_offset = ((month + 1)* 26/10).floor
      leap_year_offset = (year/4).floor + ((year/100).floor)*6 + (year/400).floor
      day_of_week = (day_of_month + march_offset + year + leap_year_offset) %7
  
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
    
    if @month == "february"
      (1 .. c.feb?(@year)).each do |i|
      month_string << space_single(i)
      end
      else
        (1 .. MONTH_LENGTH[@month.to_sym]).each do |i|
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
    weeks = []
    while h < WEEK_TOTAL
       iterative_string = ""
       while j < ITERATOR2[h].to_i and <= (month_array.length + week_start(@year, @month))
            iterative_string << (i < ITERATOR2[h].to_i ? month_array[j] + " " : month_array[j])
            j += 1
            i += 1
         end #while j
         h += 1
         weeks << iterative_string
    end #h loop
    #iterative_string = month_array.to_s.gsub(/", "/, " ").gsub(/\[\"/, "").gsub(/\"\]/, "")
    weeks #a = weeks.each { |u| iterative_string << u}
  end #def
  
  def break_out
    c = Month.new(@month, &year)
    #c.add_columns.length > 100 ? a = c.add_columns.insert(100, "/n") : a = c.add_columns.insert(80, "/n")
    if c.add_columns.length > 80
      i = 0
      a = loop do
        i += 1
        c.add_columns.insert(ITERATOR[i], "/n")
        break if i == 4
      end  
        else
            i = 1
            a = loop do            
            i += 1
            c.add_columns.insert(ITERATOR[i], "/n")
            break if i == 4
          end
    end #if
    a = loop
    print a
  end #def


def space_single(i)
    i.to_i < 10 ? " #{i}" : "#{i}"
end


end