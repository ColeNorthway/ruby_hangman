# frozen_string_literal: true
require_relative 'lib/word'
require_relative 'lib/ui'
require_relative 'lib/saver'

ALPHABET = %w[a b c d e f g h i j k l m n o p q r s t u v w z y x].freeze
WORD_I = 0
UI_I = 1
LIVES_I = 2
LETTERS_I = 3

def get_input(bad_letters, word)
  loop do
    print 'Enter a letter or "save" to save the game: '
    ans = gets.chomp.strip.downcase
    Saver.save(word) if ans == 'save'
    unless ALPHABET.include?(ans) && !bad_letters.include?(ans)
      puts 'Error: Invalid Input'
      next
    end
    return ans
  end
end

def game_state(load)
  return Saver::load if load == 'y'

  word = Word.new
  [word, UI.new(word), 8, []]
end

def start_game
  loop do
    print 'Do you want to load from a previous save [y/n]: '
    ans = gets.chomp.downcase
    if ans != 'y' || ans != 'n'
      puts 'Error: Invalid Input'
      next
    end
    return game_state(ans)
  end
end

def main
  state       = start_game
  word        = state[WORD_I]
  ui          = state[UI_I]
  lives       = state[LIVES_I]
  bad_letters = state[LETTERS_I]

  loop do
    ui.print_res(lives, bad_letters)
    letter = get_input(bad_letters, word)
    unless word.submit(letter)
      bad_letters.push(letter)
      lives -= 1
    end
    break if word.finished?(lives)
  end
end

# ENTRY
main

=begin
  1) Implement the save
  2) Implement the load
TEST
  1) Loading and saving flow
    - The saver can do this thing where if a save file alr exists it asks if you wanna overwrite
  2) Loading and saving accuracy
=end