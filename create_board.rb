class CreateBoard
  
  def self.create_board
    board = []
    alphabet = ("a".."z").to_a

    4.times do
      row = []
      4.times do
        index = rand(0..25)
        row << alphabet[index]
      end
      board << row
    end
    board
  end

end
