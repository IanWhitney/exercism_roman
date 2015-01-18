class Fixnum
  def to_roman
    dictionary = {1000 => "M", 500 => "D", 100 => "C", 50 => "L", 10 => "X", 5 => "V", 1 => "I"}
    RomanNumerals.new(dictionary, DeciRomans, self).to_s
  end

  def to_neoroman
    dictionary = {1000 => "O", 500 => "Q", 100 => "G", 50 => "P", 10 => "B", 5 => "R", 1 => "J"}
    RomanNumerals.new(dictionary, DeciRomans, self).to_s
  end

  def to_exoroman
    dictionary = {10_000 => "&", 5000 => "*", 1000 => "O", 500 => "Q", 100 => "G", 50 => "P", 10 => "B", 5 => "R", 1 => "J"}
    RomanNumerals.new(dictionary, DeciRomans, self).to_s
  end

  def to_duodeciroman
    dictionary = {1728 => "Â", 864 => "Î", 144 => "Ç", 72 => "Ò", 12 => "¶", 6 => "∂", 1 => "˚"}
    RomanNumerals.new(dictionary, DuoDeciRomans, self).to_s
  end
end

class RomanNumerals
  attr_accessor :dictionary, :family, :number
  def initialize(dictionary, family, number)
    self.dictionary = dictionary
    self.family = family
    self.number = number
  end

  def to_s
    letters = ""
    num = number
    dictionary.keys.each_slice(2) do |multiple, _|
      x = num / multiple
      rom = case
      when (x == family.multiple - 1)
        "#{dictionary[multiple]}#{dictionary[multiple * family.multiple]}"
      when (x >= family.half_multiple)
        dictionary[multiple * family.half_multiple] + (dictionary[multiple] * (x - family.half_multiple))
      when (x == family.half_multiple - 1)
        "#{dictionary[multiple]}#{dictionary[multiple * family.half_multiple]}"
      else
        dictionary[multiple] * x
      end
      num = num.remainder(multiple)
      letters += rom
    end
    letters
  end
end


class DeciRomans
  def self.multiple
    10
  end

  def self.half_multiple
    multiple/2
  end
end

class DuoDeciRomans
  def self.multiple
    12
  end

  def self.half_multiple
    multiple/2
  end
end
