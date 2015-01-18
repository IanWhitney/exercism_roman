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
    to_letters(conversion)
  end

  def to_duodeciroman
    conversion = {1728 => "Â", 864 => "Î", 144 => "Ç", 72 => "Ò", 12 => "¶", 6 => "∂", 1 => "˚"}
    to_duodeci_letters(conversion)
  end

  private

  def to_letters(conversion)
    letters = ""
    num = self
    conversion.keys.each_slice(2) do |multiple_of_ten, _|
      x = num / multiple_of_ten
      rom = case
      when (x == 9)
        "#{conversion[multiple_of_ten]}#{conversion[multiple_of_ten * 10]}"
      when (x >= 5)
        conversion[multiple_of_ten * 5] + (conversion[multiple_of_ten] * (x - 5))
      when (x == 4)
        "#{conversion[multiple_of_ten]}#{conversion[multiple_of_ten * 5]}"
      else
        conversion[multiple_of_ten] * x
      end
      num = num.remainder(multiple_of_ten)
      letters += rom
    end
    letters
  end

  def to_duodeci_letters(conversion)
    letters = ""
    num = self
    conversion.keys.each_slice(2) do |multiple_of_twelve, _|
      x = num / multiple_of_twelve
      rom = case
      when (x == 11)
        "#{conversion[multiple_of_twelve]}#{conversion[multiple_of_twelve * 12]}"
      when (x >= 6)
        conversion[multiple_of_twelve * 6] + (conversion[multiple_of_twelve] * (x - 6))
      when (x == 5)
        "#{conversion[multiple_of_twelve]}#{conversion[multiple_of_twelve * 6]}"
      else
        conversion[multiple_of_twelve] * x
      end
      num = num.remainder(multiple_of_twelve)
      letters += rom
    end
    letters
  end
end
