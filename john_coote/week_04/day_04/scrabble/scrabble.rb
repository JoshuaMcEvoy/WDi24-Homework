require "pry"

@values = {
  "A" => 1,
  "B" => 3,
  "C" => 3,
  "D" => 2,
  "E" => 1,
  "F" => 4,
  "G" => 2,
  "H" => 4,
  "I" => 1,
  "J" => 8,
  "K" => 5,
  "L" => 1,
  "M" => 3,
  "N" => 1,
  "O" => 1,
  "P" => 3,
  "Q" => 10,
  "R" => 1,
  "S" => 1,
  "T" => 1,
  "U" => 1,
  "V" => 4,
  "W" => 4,
  "X" => 8,
  "Y" => 4,
  "Z" => 10
}

def score(word)

word_array = word.chars
@word_score = 0
#binding.pry

word_array.each { |char|
  puts char
  letter_score = @values[char]
  @word_score = @word_score + letter_score
  # binding.pry

}




end

score("CABBAGE")
binding.pry
