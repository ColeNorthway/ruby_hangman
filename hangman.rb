# frozen_string_literal: true
require_relative 'lib/word'
require_relative 'lib/ui'

ALPHABET = %w[a b c d e f g h i j k l m n o p q r s t u v w z y x].freeze

def get_letter
  loop do
    print 'Enter a letter: '
    letter = gets.chomp.strip.downcase
    unless ALPHABET.include?(letter)
      puts 'Error: Invalid Input'
      next
    end
    return letter
  end
end

def main
  word = Word.new
  ui = UI.new(word)
  lives = 8
  bad_letters = []

  loop do
    ui.print_res(lives, bad_letters)
    letter = get_letter
    unless word.submit(letter)
      bad_letters.push(letter)
      lives -= 1
    end
    break if word.finished(lives)
  end
end

# ENTRY
main

=begin
Test
  - Make sure we can detect a correct or incorrect letter
  - Make sure that the skeleton is mapped
  - Make sure the game finishes smooth
=end