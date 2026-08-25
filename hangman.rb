# frozen_string_literal: true
require_relative 'lib/word'
require_relative 'lib/ui'

def main
  word = Word.new
  ui = UI.new(word)

  loop do
    print
  end
end

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
  - The word picked
  - The skeleton
  - The UI printing
  - The sanitization/normalization of input
  -
=end