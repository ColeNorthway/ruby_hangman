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
  bad_letters = %w[a b]

  loop do
    ui.print_res(lives, bad_letters)
    letter = get_letter
  end
end

# ENTRY
main

=begin
  2) Next we need to design the main loop
    - Start with init the word class
    - Init the UI class with the word class
    - Then enter an infinite loop prompting the user for a letter and validating and sanitizing input
    - It then will query the word class for validity which then the word class responds by true or false
    - If false the letter is put into a bad letter list and a life is lost (8 lives)
    - If true the word class updates itself
  3) Keep going until out of lives or we get the word

Test
  - Make sure we can detect a correct or incorrect letter
  - Make sure that the skeleton is mapped
=end