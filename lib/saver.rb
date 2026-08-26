# frozen_string_literal: true

require 'json'
require_relative 'word'

PATH = "#{File.dirname(__FILE__)}/../data/savestate.json"

# The Saver Module is a module that simply will...
#   - Load a json file
#   - Save a json file
#   - These json files represent the gamestate
module Saver
  module_function

  def check_exists_load
    unless File.exist?(PATH)
      puts "Error: Save file doesn't exist"
      exit!(0)
    end
  end

  def load
    check_exists_load
    puts 'Loading...'
    json = JSON.load_file(PATH)

    [Word.new(json['word'], json['word_skeleton']), json['lives'], json['bad_letters']]
  end

  def check_exists_save
    if File.exist?(PATH)
      loop do
        print 'There is a previous save do you want to overwrite [y/n]: '
        ans = gets.chomp.downcase

        if ans != 'y' && ans != 'n'
          puts 'Error: Invalid Input'
          next
        end

        return true if ans == 'y'
        return false
      end
    end
    true
  end

  def save(word, bad_letters, lives)
    puts 'Saving game...'
    return nil unless check_exists_save

    j_data = { word: word.word, word_skeleton: word.word_skeleton, bad_letters: bad_letters, lives: lives }
    File.open(PATH, 'w') do |file|
      JSON.dump(j_data, file)
    end
    puts 'Game saved!'
    exit!(0)
  end
end
