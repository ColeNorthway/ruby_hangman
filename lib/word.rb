# frozen_string_literal: true

class Word
  def initialize
    words = File.readlines('../data/10000_words.txt', chomp: true)
    @word = ''
    @word_skeleton = ''
    until (@word = words.sample(1)[0]).length.between?(5, 12)
    end
    @word.length.times { @word_skeleton += '_' }
  end

end
