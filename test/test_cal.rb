require 'test/unit'
require 'month'
require 'cal'

class CalendarTest < Test::Unit::TestCase

  def setup
    @month = ARGV[0]
    @year = ARGV[1]
    puts @month
  end
  
  def test_23_ARGV
    c = Month.new("May", "1992")
    assert_equal("May", c.month)
    pp ARGV
  end
  
  def test_25_year_returns_row_1
    c = Calendar.new("1992")
    u = c.build_year
    assert_equal("          1  2  3  4                     1   1  2  3  4  5  6  7", c.week)
  end
  
  def test_26_jan_92_returns_1st_week
    c = Calendar.new(1992)
    u = c.build_year
    assert_equal("          1  2  3  4", c.pad_week(u[0][0]))
  end
  
  def test_27_may_92_returns_padded_week
    c = Calendar.new(1992)
    u = c.build_year
    assert_equal("31                  ", c.pad_week(u[4][5]))
  end
  
  def test_28_apr_92_returns_empty_week
    c = Calendar.new(1992)
    u = c.build_year
    assert_equal("                    ", c.pad_week(u[3][5]))
  end
  
  def test_24_single_argv_yields_year
    c = Calendar.new(1992)
    assert_equal(1992, c.year)
  end
  
  def test_29_nil_week_yields_blanks
    c = Calendar.new(1992)
    u = c.build_year
    assert_equal("                    ", c.pad_week(u[0][5]))
  end
  
  def test_50_1992_calendar
    @year = 1992
    c = Calendar.new(1992)
    u = c.build_year
    assert_equal("""                             1992                             

      January               February               March       
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
          1  2  3  4                     1   1  2  3  4  5  6  7
 5  6  7  8  9 10 11   2  3  4  5  6  7  8   8  9 10 11 12 13 14
12 13 14 15 16 17 18   9 10 11 12 13 14 15  15 16 17 18 19 20 21
19 20 21 22 23 24 25  16 17 18 19 20 21 22  22 23 24 25 26 27 28
26 27 28 29 30 31     23 24 25 26 27 28 29  29 30 31

       April                  May                   June        
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
          1  2  3  4                  1  2      1  2  3  4  5  6
 5  6  7  8  9 10 11   3  4  5  6  7  8  9   7  8  9 10 11 12 13
12 13 14 15 16 17 18  10 11 12 13 14 15 16  14 15 16 17 18 19 20
19 20 21 22 23 24 25  17 18 19 20 21 22 23  21 22 23 24 25 26 27
26 27 28 29 30        24 25 26 27 28 29 30  28 29 30
                      31
        July                 August              September     
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
          1  2  3  4                     1         1  2  3  4  5
 5  6  7  8  9 10 11   2  3  4  5  6  7  8   6  7  8  9 10 11 12
12 13 14 15 16 17 18   9 10 11 12 13 14 15  13 14 15 16 17 18 19
19 20 21 22 23 24 25  16 17 18 19 20 21 22  20 21 22 23 24 25 26
26 27 28 29 30 31     23 24 25 26 27 28 29  27 28 29 30
                      30 31
      October               November              December      
             1  2  3   1  2  3  4  5  6  7         1  2  3  4  5
 4  5  6  7  8  9 10   8  9 10 11 12 13 14   6  7  8  9 10 11 12
11 12 13 14 15 16 17  15 16 17 18 19 20 21  13 14 15 16 17 18 19
18 19 20 21 22 23 24  22 23 24 25 26 27 28  20 21 22 23 24 25 26
25 26 27 28 29 30 31  29 30                 27 28 29 30 31""", c.printout(u))
  
  end


end