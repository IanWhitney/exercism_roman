class Fixnum
  ROMAN_CONVERSION = {1000 => "M", 500 => "D", 100 => "C", 50 => "L", 10 => "X", 5 => "V", 1 => "I"}

  def to_roman
    t, rem = to_thousands(self)
    h, rem = to_hundreds(rem)
    te, rem = to_tens(rem)
    o, _ = to_ones(rem)

    t + h + te + o
  end

  def to_neoroman
    t, rem = to_neo_thousands(self)
    h, rem = to_neo_hundreds(rem)
    te, rem = to_neo_tens(rem)
    o, _ = to_neo_ones(rem)

    t + h + te + o
  end

  private

  def to_thousands(x, conversion = ROMAN_CONVERSION)
    rom = conversion[1000] * (x / 1000)
    [rom, x.remainder(1000)]
  end

  def to_hundreds(x, conversion = ROMAN_CONVERSION)
    h = x / 100
    rom = case
    when (h == 9)
      "#{conversion[100]}#{conversion[1000]}"
    when (h >= 5)
      conversion[500] + (conversion[100] * (h - 5))
    when (h == 4)
      "#{conversion[100]}#{conversion[500]}"
    else
      conversion[100] * h
    end
    [rom, x.remainder(100)]
  end

  def to_tens(x, conversion = ROMAN_CONVERSION)
    t = x / 10
    rom = case
    when (t == 9)
      "#{conversion[10]}#{conversion[100]}"
    when (t >= 5)
      conversion[50] + (conversion[10] * (t - 5))
    when (t == 4)
      "#{conversion[10]}#{conversion[50]}"
    else
      conversion[10] * t
    end
    [rom, x.remainder(10)]
  end

  def to_ones(x, conversion = ROMAN_CONVERSION)
    case
    when (x == 9)
      "#{conversion[1]}#{conversion[10]}"
    when (x >= 5)
      conversion[5] + (conversion[1] * (x - 5))
    when (x == 4)
      "#{conversion[1]}#{conversion[5]}"
    else
      conversion[1] * x
    end
  end

  def to_neo_thousands(x)
    rom = "O" * (x / 1000)
    [rom, x.remainder(1000)]
  end

  def to_neo_hundreds(x)
    h = x / 100
    rom = case
    when (h == 9)
      "GO"
    when (h >= 5)
      "Q" + ("G" * (h - 5))
    when (h == 4)
      "GQ"
    else
      "G" * h
    end
    [rom, x.remainder(100)]
  end

  def to_neo_tens(x)
    t = x / 10
    rom = case
    when (t == 9)
      "BG"
    when (t >= 5)
      "P" + ("B" * (t - 5))
    when (t == 4)
      "BP"
    when (t > 0)
      "B" * t
    else
      ""
    end
    [rom, x.remainder(10)]
  end

  def to_neo_ones(x)
    case
    when (x == 9)
      "JB"
    when (x >= 5)
      "R" + ("J" * (x - 5))
    when (x == 4)
      "JR"
    else
      "J" * x
    end
  end
end
