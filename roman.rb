class Fixnum

  def to_roman
    conversion = {1000 => "M", 500 => "D", 100 => "C", 50 => "L", 10 => "X", 5 => "V", 1 => "I"}
    to_letters(conversion)
  end

  def to_neoroman
    conversion = {1000 => "O", 500 => "Q", 100 => "G", 50 => "P", 10 => "B", 5 => "R", 1 => "J"}
    to_letters(conversion)
  end

  def to_exoroman
    conversion = {10_000 => "&", 5000 => "*", 1000 => "O", 500 => "Q", 100 => "G", 50 => "P", 10 => "B", 5 => "R", 1 => "J"}
    to_exoletters(conversion)
  end

  private

  def to_exoletters(conversion)
    tt, rem = to_exo_ten_thousands(self, conversion)
    t, rem = to_exo_thousands(rem, conversion)
    h, rem = to_hundreds(rem, conversion)
    te, rem = to_tens(rem, conversion)
    o, _ = to_ones(rem, conversion)

    tt + t + h + te + o
  end

  def to_letters(conversion)
    t, rem = to_thousands(self, conversion)
    h, rem = to_hundreds(rem, conversion)
    te, rem = to_tens(rem, conversion)
    o, _ = to_ones(rem, conversion)

    t + h + te + o
  end

  def to_exo_ten_thousands(x, conversion)
    rom = conversion[10000] * (x / 10000)
    [rom, x.remainder(10000)]
  end

  def to_exo_thousands(x, conversion)
    h = x / 1000
    rom = case
    when (h == 9)
      "#{conversion[1000]}#{conversion[10000]}"
    when (h >= 5)
      conversion[5000] + (conversion[1000] * (h - 5))
    when (h == 4)
      "#{conversion[1000]}#{conversion[5000]}"
    else
      conversion[1000] * h
    end
    [rom, x.remainder(1000)]
  end

  def to_thousands(x, conversion)
    rom = conversion[1000] * (x / 1000)
    [rom, x.remainder(1000)]
  end

  def to_hundreds(x, conversion)
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

  def to_tens(x, conversion)
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

  def to_ones(x, conversion)
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
end
