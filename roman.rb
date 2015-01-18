class Fixnum
  def to_roman
    dictionary = {1000 => "M", 500 => "D", 100 => "C", 50 => "L", 10 => "X", 5 => "V", 1 => "I"}
    RomanConverter.new(dictionary, DeciRomans).convert(self)
  end

  def to_neoroman
    dictionary = {1000 => "O", 500 => "Q", 100 => "G", 50 => "P", 10 => "B", 5 => "R", 1 => "J"}
    RomanConverter.new(dictionary, DeciRomans).convert(self)
  end

  def to_exoroman
    dictionary = {10_000 => "&", 5000 => "*", 1000 => "O", 500 => "Q", 100 => "G", 50 => "P", 10 => "B", 5 => "R", 1 => "J"}
    RomanConverter.new(dictionary, DeciRomans).convert(self)
  end
end

class RomanConverter
  attr_accessor :dictionary, :family
  def initialize(dictionary, family)
    self.dictionary = dictionary
    self.family = family
  end

  def convert(num)
    letters = ""
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
