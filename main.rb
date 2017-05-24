require 'ruby-dictionary'

require_relative 'create_board'
require_relative 'boggle'

board = CreateBoard.create_board
board.each {|row| p row}
dictionary = Dictionary.from_file('words.txt')

game = Boggle.new(board, dictionary)
all_words = game.boggle()
p all_words
