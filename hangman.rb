# frozen_string_literal: true
require_relative 'lib/word'
require_relative 'lib/ui'
require_relative 'lib/saver'

ALPHABET = %w[a b c d e f g h i j k l m n o p q r s t u v w z y x].freeze
WORD_I = 0
LIVES_I = 1
LETTERS_I = 2

def get_input(word, bad_letters, lives)
  loop do
    print 'Enter a letter or "save" to save the game: '
    ans = gets.chomp.strip.downcase

    if ans == 'save'
      Saver.save(word, bad_letters, lives)
      next
    end
    unless ALPHABET.include?(ans) && !bad_letters.include?(ans)
      puts 'Error: Invalid Input'
      next
    end

    return ans
  end
end

def game_state(load)
  return Saver::load if load == 'y'
  [Word.new, 8, []]
end

def start_game
  loop do
    print 'Do you want to load from a previous save [y/n]: '
    ans = gets.chomp.downcase
    if ans != 'y' && ans != 'n'
      puts 'Error: Invalid Input'
      next
    end
    return game_state(ans)
  end
end

def main
  state       = start_game
  word        = state[WORD_I]
  lives       = state[LIVES_I]
  bad_letters = state[LETTERS_I]
  ui          = UI.new(word)


  loop do
    ui.print_res(lives, bad_letters)
    letter = get_input(word, bad_letters, lives)
    unless word.submit(letter)
      bad_letters.push(letter)
      lives -= 1
    end
    break if word.finished?(lives)
  end
end

# ENTRY
main

