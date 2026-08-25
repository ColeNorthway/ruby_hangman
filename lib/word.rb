# frozen_string_literal: true

# The word class handles...
#   - Validating submissions
#   - Making the outline of the word
class Word
  attr_reader :word_skeleton

  def initialize
    words = File.readlines("#{File.dirname(__FILE__)}/../data/10000_words.txt", chomp: true)
    @word = ''
    @word_skeleton = ''
    until (@word = words.sample(1)[0].downcase).length.between?(5, 12)
    end
    @word.length.times { @word_skeleton += '_' }
  end

  def apply(letter)
    indices = @word.each_with_index.reduce([]) { |arr, l, i| arr.push(i) if l == letter }
    indices.each { |i| @word_skeleton[i] = letter }
  end

  def submit(letter)
    unless @word.include?(letter)
      puts 'Bad Guess :*('
      return false
    end

    puts 'Correct Guess :)'
    self.apply(letter)
    true
  end
end
