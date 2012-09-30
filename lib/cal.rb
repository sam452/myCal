require_relative 'month'

class Calendar
  include Enumerable
  
  def initialize *args
    @month = ARGV[0].chomp!.downcase!
    @year = ARGV[1].chomp!.to_i
#     c = Month.new(@month, @year)
#    month = c.add_columns
#   puts month
  end
  

end