# Roman Numerals

Write a function to convert from normal numbers to Roman Numerals: e.g.

The Romans were a clever bunch. They conquered most of Europe and ruled
it for hundreds of years. They invented concrete and straight roads and
even bikinis. One thing they never discovered though was the number
zero. This made writing and dating extensive histories of their exploits
slightly more challenging, but the system of numbers they came up with
is still in use today. For example the BBC uses Roman numerals to date
their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice
these letters have lots of straight lines and are hence easy to hack
into stone tablets).

```
 1  => I
10  => X
 7  => VII
```

There is no need to be able to convert numbers larger than about 3000.
(The Romans themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each
digit separately starting with the left most digit and skipping any
digit with a value of zero.

To see this in practice, consider the example of 1990.

In Roman numerals 1990 is MCMXC:

1000=M
900=CM
90=XC

2008 is written as MMVIII:

2000=MM
8=VIII

See also: http://www.novaroma.org/via_romana/numbers.html


## Source

The Roman Numeral Kata [view source](http://codingdojo.org/cgi-bin/wiki.pl?KataRomanNumerals)

I = 1
V = 5
X = 10
L = 50
C = 100
D = 500
M = 1000

    assert_equal 'I', 1.to_roman
    assert_equal 'CMXI', 911.to_roman

New behavior on integers

one's place becomes I/V

1.to_ones => I
2.to_ones => II
3.to_ones => III
4.to_ones => IV
5.to_ones => V
6.to_ones => VI
7.to_ones => VII
8.to_ones => VIII
9.to_ones => IX

10.to_tens => X

C
CC
CCC
CD
D
DC
DCC
DCCC
CM


def to_roman
  t, rem = to_thousands 
  h, rem = to_hundreds
  te, rem = to_tens
  o, rem = to_ones

  t + h + te + o
end

def to_thousands
  rom = "M" * (self / 1000)
  [rom, self.remainder(1000)]
end

def to_hundreds
  h = self / 100
  rom = case h
  when 9
    "CM"
  when >= 5
    "D" + ("C" * (h - 5))
  when 4
    "CD"
  when > 0
    "C" * h
  else
    ""
  end
  [rom, self.remainder(100)]
end

def to_tens
  t = self / 10
  rom = case t
  when 9
    "XC"
  when >= 5
    "L" + ("X" * (t - 5))
  when 4
    "XL"
  when > 0
    "X" * t
  else
    ""
  end
  [rom, self.remainder(10)]
end

def to_ones
  rom = case self
  when 9
    "IX"
  when >= 5
    "V" + ("I" * (self - 5))
  when 4
    "IV"
  when > 0
    "I" * self
  else
    ""
  end
  [rom, 0]
end

chunk
  
  next letter the same? 
    Include in chunk
  next digit bigger? 
    Include in chunk
  next digit smaller?
    end chunk

MCMXC: [M, CM, XC]: [1000, 900, 90]
MMVIII: [MM, V, III]: [2000, 5, 3]

