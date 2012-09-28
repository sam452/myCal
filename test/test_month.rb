require 'test/unit'
require 'month'

class MonthTest < Test::Unit::TestCase

  def test_01_dec_01_2041
    m = Month.new("december", 2041)
    assert_equal(1, m.week_start(m.year, m.month))
  end

  def test_02_feb_01_1865
    m = Month.new("february", 1865)
    assert_equal(4, m.week_start(m.year, m.month))
  end

  def test_05_jan_01_1998
    m = Month.new("january", 1998)
    assert_equal(5, m.week_start(m.year, m.month))
  end

  def test_03_may_01_2999
    m = Month.new("may", 2099)
    assert_equal(6, m.week_start(m.year, m.month))
  end

  def test_04_Aug_01_1999
    m = Month.new("august", 1999)
    assert_equal(1, m.week_start(m.year, m.month))
  end

  def test_06_Sep_01_1888
    m = Month.new("september", 1888)
    assert_equal(0, m.week_start(m.year, m.month))
  end

  def test_07_Mar_01_1889
    m = Month.new("march", 1889)
    assert_equal(6, m.week_start(m.year, m.month))
  end
  
  def test_08_2013_should_return_28
    m = Month.new("may", 2013)
    assert_equal(28, m.feb?(m.year))
  end

  def test_09_2012_should_return_29
    m = Month.new("may", 2012)
    assert_equal(29, m.feb?(m.year))
  end

  def test_10_1900_should_return_28
    m = Month.new("may", 1900)
    assert_equal(28, m.feb?(m.year))
  end

  def test_11_2000_should_return_29
    m = Month.new("may", 2000)
    assert_equal(29, m.feb?(m.year))
  end

  def test_12_Monday_should_pad_1
    m = Month.new("may", 2000)
    assert_equal(1, m.padding)
  end

  def test_12_Saturday_should_pad_6
    m = Month.new("september", 1888)
    assert_equal(6, m.padding)
  end
  
  def test_13_feb_2000_run_string
    m = Month.new("february", 2000)
    assert_equal(["  ", "  ", " 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29"], m.run)
  end

  def test_1_may_1865_run_string
    m = Month.new("may", 1865)
    assert_equal(["  ",  " 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"], m.run)
  end

  def test_15_feb_1999_run_string
    m = Month.new("february", 1999)
    assert_equal(["  ", " 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28"], m.run)
  end

  def test_16_feb_1999_iterative_into_string
    m = Month.new("february", 1999)
    assert_equal(["    1  2  3  4  5  6",
 " 7  8  9 10 11 12 13",
 "14 15 16 17 18 19 20",
 "21 22 23 24 25 26 27",
 "28"], m.add_columns)
  end

  def test_18_feb_2000_iterative_into_string
    m = Month.new("february", 2000)
    assert_equal(["       1  2  3  4  5",
 " 6  7  8  9 10 11 12",
 "13 14 15 16 17 18 19",
 "20 21 22 23 24 25 26",
 "27 28 29"], m.add_columns)
  end

  def test_17_mar_1889_iterative_into_string
    m = Month.new("march", 1889)
    assert_equal(["                1  2",
 " 3  4  5  6  7  8  9",
 "10 11 12 13 14 15 16",
 "17 18 19 20 21 22 23",
 "24 25 26 27 28 29 30",
 "31"], m.add_columns)
  end

  def test_19_mar_1889_iterative_into_string
    m = Month.new("september", 1888)
    assert_equal(["                   1",
 " 2  3  4  5  6  7  8",
 " 9 10 11 12 13 14 15",
 "16 17 18 19 20 21 22",
 "23 24 25 26 27 28 29",
 "30"], m.add_columns)
  end

  def test_20_jan_1998_iterative_into_string
    m = Month.new("january", 1998)
    assert_equal(["             1  2  3",
 " 4  5  6  7  8  9 10",
 "11 12 13 14 15 16 17",
 "18 19 20 21 22 23 24",
 "25 26 27 28 29 30 31"], m.add_columns)
  end

  def test_21_jan_1998_array_into_big_string
    m = Month.new("january", 1998)
    assert_equal("""    January 1998    
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31""", m.printout)
  end

  def test_22_jfeb_1999_array_into_big_string
    m = Month.new("february", 1999)
    assert_equal("""   February 1999    
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28""", m.printout)
  end


end