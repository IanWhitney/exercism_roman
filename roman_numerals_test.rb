require 'minitest/autorun'
require_relative 'roman'

class RomanTest < MiniTest::Unit::TestCase
  def test_1
    assert_equal 'I', 1.to_roman
  end

  def test_2
    assert_equal 'II', 2.to_roman
  end

  def test_3
    assert_equal 'III', 3.to_roman
  end

  def test_4
    assert_equal 'IV', 4.to_roman
  end

  def test_5
    assert_equal 'V', 5.to_roman
  end

  def test_6
    assert_equal 'VI', 6.to_roman
  end

  def test_9
    assert_equal 'IX', 9.to_roman
  end

  def test_27
    assert_equal 'XXVII', 27.to_roman
  end

  def test_48
    assert_equal 'XLVIII', 48.to_roman
  end

  def test_59
    assert_equal 'LIX', 59.to_roman
  end

  def test_93
    assert_equal 'XCIII', 93.to_roman
  end

  def test_141
    assert_equal 'CXLI', 141.to_roman
  end

  def test_163
    assert_equal 'CLXIII', 163.to_roman
  end

  def test_402
    assert_equal 'CDII', 402.to_roman
  end

  def test_575
    assert_equal 'DLXXV', 575.to_roman
  end

  def test_911
    assert_equal 'CMXI', 911.to_roman
  end

  def test_1024
    assert_equal 'MXXIV', 1024.to_roman
  end

  def test_3000
    assert_equal 'MMM', 3000.to_roman
  end
end

class NeoRomanTest < MiniTest::Unit::TestCase
  def test_1
    assert_equal 'J', 1.to_neoroman
  end

  def test_2
    assert_equal 'JJ', 2.to_neoroman
  end

  def test_3
    assert_equal 'JJJ', 3.to_neoroman
  end

  def test_4
    assert_equal 'JR', 4.to_neoroman
  end

  def test_5
    assert_equal 'R', 5.to_neoroman
  end

  def test_6
    assert_equal 'RJ', 6.to_neoroman
  end

  def test_9
    assert_equal 'JB', 9.to_neoroman
  end

  def test_27
    assert_equal 'BBRJJ', 27.to_neoroman
  end

  def test_48
    assert_equal 'BPRJJJ', 48.to_neoroman
  end

  def test_59
    assert_equal 'PJB', 59.to_neoroman
  end

  def test_93
    assert_equal 'BGJJJ', 93.to_neoroman
  end

  def test_141
    assert_equal 'GBPJ', 141.to_neoroman
  end

  def test_163
    assert_equal 'GPBJJJ', 163.to_neoroman
  end

  def test_402
    assert_equal 'GQJJ', 402.to_neoroman
  end

  def test_575
    assert_equal 'QPBBR', 575.to_neoroman
  end

  def test_911
    assert_equal 'GOBJ', 911.to_neoroman
  end

  def test_1024
    assert_equal 'OBBJR', 1024.to_neoroman
  end

  def test_3000
    assert_equal 'OOO', 3000.to_neoroman
  end
end

class ExoRomanTest < MiniTest::Unit::TestCase
  def test_4000
    assert_equal 'O*', 4000.to_exoroman
  end

  def test_5000
    assert_equal '*', 5000.to_exoroman
  end

  def test_7000
    assert_equal '*OO', 7000.to_exoroman
  end

  def test_9000
    assert_equal 'O&', 9000.to_exoroman
  end

  def test_10_000
    assert_equal '&', 10_000.to_exoroman
  end
end

class DuoDeciRomanTest < MiniTest::Unit::TestCase
  def test_1
    assert_equal '˚', 1.to_duodeciroman
  end

  def test_5
    assert_equal '˚∂', 5.to_duodeciroman
  end

  def test_6
    assert_equal '∂', 6.to_duodeciroman
  end

  def test_11
    assert_equal '˚¶', 11.to_duodeciroman
  end

  def test_12
    assert_equal '¶', 12.to_duodeciroman
  end

  def test_3456
    assert_equal 'ÂÂ', 3456.to_duodeciroman
  end
end
