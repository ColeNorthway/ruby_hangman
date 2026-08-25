# frozen_string_literal: true

require_relative 'word'

# The class ui handles printing for the game
#   - Uses a word reference to get the filled word
#   - Takes lives and bad letters from main loop
class UI
  def initialize(word)
    @word = word
  end

  def print_res(lives, guessed)
    puts "Lives Left: #{lives}"
    puts "Word to Guess: #{@word.word_skeleton}"
    puts "Wrong Letters: #{guessed.join(', ')}\n"
  end
end
