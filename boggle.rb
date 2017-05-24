require_relative 'adjacent'

class Boggle

  attr_reader :board, :dictionary, :adjacent

  WORDS = []

  def initialize(board, dictionary)
    @board = board
    @dictionary = dictionary
    @adjacent = Adjacent.new(board)
  end

  def boggle()

    board.each_with_index do |row, outer_index|
      row.each_with_index do |letter, inner_index|

        current_letter_position = [outer_index,inner_index]
        used_chars_position = [current_letter_position]

        word_start = letter

        building_words(word_start,current_letter_position, used_chars_position)

      end
    end
    WORDS.uniq.sort
  end


  def building_words(word_start, current_letter_position, used_chars_position)

    WORDS << word_start if dictionary.exists?(word_start)

    adjacent_letters = adjacent.adjacent_index_and_characters(current_letter_position)
    used_chars_position.each {|position| adjacent_letters.delete(position) if adjacent_letters.include?(position)}

    adjacent_letters.each do |position, letter|

      add_to_used_chars_position = used_chars_position.clone
      add_to_used_chars_position << position
      concat_word = word_start + letter

      building_words(concat_word, position, add_to_used_chars_position)
    end
  end
end
