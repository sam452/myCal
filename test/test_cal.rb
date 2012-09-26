require 'test/unit'
require 'cal.rb'

class CalTest < Test::Unit::TestCase

  def test_01_dec_01_2041
    assert_equal(1, week_start(2041, "december"))
  end

  def test_02_feb_01_1865
    assert_equal(4, week_start(1865, "february"))
  end

  def test_05_jan_01_1998
    assert_equal(5, week_start(1998, "january"))
  end

  def test_03_may_01_2999
    assert_equal(6, week_start(2099, "may"))
  end

  def test_04_Aug_01_1999
    assert_equal(1, week_start(1999, "august"))
  end

  def test_06_Sep_01_1888
    assert_equal(0, week_start(1888, "september"))
  end

  def test_07_Mar_01_1889
    assert_equal(6, week_start(1889, "march"))
  end
  
  def test_08_2013_should_return_28
    assert_equal(28, feb?(2013))
  end

  def test_09_2012_should_return_29
    assert_equal(29, feb?(2012))
  end

  def test_10_1900_should_return_28
    assert_equal(28, feb?(1900))
  end

  def test_11_2000_should_return_29
    assert_equal(29, feb?(2000))
  end



end