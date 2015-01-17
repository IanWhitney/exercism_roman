class Fixnum
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

  def to_thousands(x)
    rom = "M" * (x / 1000)
    [rom, x.remainder(1000)]
  end

  def to_hundreds(x)
    h = x / 100
    rom = case
    when (h == 9)
      "CM"
    when (h >= 5)
      "D" + ("C" * (h - 5))
    when (h == 4)
      "CD"
    else
      "C" * h
    end
    [rom, x.remainder(100)]
  end

  def to_tens(x)
    t = x / 10
    rom = case
    when (t == 9)
      "XC"
    when (t >= 5)
      "L" + ("X" * (t - 5))
    when (t == 4)
      "XL"
    when (t > 0)
      "X" * t
    else
      ""
    end
    [rom, x.remainder(10)]
  end

  def to_ones(x)
    case
    when (x == 9)
      "IX"
    when (x >= 5)
      "V" + ("I" * (x - 5))
    when (x == 4)
      "IV"
    else
      "I" * x
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
