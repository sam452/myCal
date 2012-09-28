require_relative 'month'

class Calendar
  
  def calendar
    c = Month.new(@month, @year)
    month = c.add_columns
    return month
  end

end