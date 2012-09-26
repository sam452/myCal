require 'test/unit'
require 'cal'

class CalTest < Test::Unit::TestCase

  def test_01_dec_01_2041
    c = Calendar.new("december", 2041)
    assert_equal(1, c.week_start(c.year, c.month))
  end

  def test_02_feb_01_1865
    c = Calendar.new("february", 1865)
    assert_equal(4, c.week_start(c.year, c.month))
  end

  def test_05_jan_01_1998
    c = Calendar.new("january", 1998)
    assert_equal(5, c.week_start(c.year, c.month))
  end

  def test_03_may_01_2999
    c = Calendar.new("may", 2099)
    assert_equal(6, c.week_start(c.year, c.month))
  end

  def test_04_Aug_01_1999
    c = Calendar.new("august", 1999)
    assert_equal(1, c.week_start(c.year, c.month))
  end

  def test_06_Sep_01_1888
    c = Calendar.new("september", 1888)
    assert_equal(0, c.week_start(c.year, c.month))
  end

  def test_07_Mar_01_1889
    c = Calendar.new("march", 1889)
    assert_equal(6, c.week_start(c.year, c.month))
  end
  
  def test_08_2013_should_return_28
    c = Calendar.new("may", 2013)
    assert_equal(28, c.feb?(c.year))
  end

  def test_09_2012_should_return_29
    c = Calendar.new("may", 2012)
    assert_equal(29, c.feb?(c.year))
  end

  def test_10_1900_should_return_28
    c = Calendar.new("may", 1900)
    assert_equal(28, c.feb?(c.year))
  end

  def test_11_2000_should_return_29
    c = Calendar.new("may", 2000)
    assert_equal(29, c.feb?(c.year))
  end

  def test_12_Monday_should_pad_1
    c = Calendar.new("may", 2000)
    assert_equal(1, c.padding)
  end

  def test_12_Saturday_should_pad_6
    c = Calendar.new("september", 1888)
    assert_equal(6, c.padding)
  end


end