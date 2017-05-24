class Adjacent

  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def adjacent_index_and_characters(initial_position)
    index_and_characters = {}

    outer = initial_position.first
    inner = initial_position.last

    left = inner - 1
    up = outer - 1
    right = inner + 1
    down = outer + 1

    # left => inner - 1
    index_and_characters[[outer,left]] = board[outer][left] if index_valid?(left)
    # up-left => outer - 1, inner - 1
    index_and_characters[[up, left]] = board[up][left] if index_valid?(up) && index_valid?(left)
    # up => outer - 1
    index_and_characters[[up, inner]] = board[up][inner] if index_valid?(up)
    # up-right => outer - 1, inner + 1
    index_and_characters[[up, right]] = board[up][right] if index_valid?(up) && index_valid?(right)
    # right => inner + 1
    index_and_characters[[outer, right]] = board[outer][right] if index_valid?(right)
    # down-right => outer + 1, inner + 1
    index_and_characters[[down, right]] = board[down][right] if index_valid?(down) && index_valid?(right)
    # down => outer + 1
    index_and_characters[[down, inner]] = board[down][inner] if index_valid?(down)
    # down-left => outer + 1, inner - 1
    index_and_characters[[down, left]] = board[down][left] if index_valid?(down) && index_valid?(left)

    index_and_characters
  end

  def index_valid?(new_index)
    new_index < 0 || new_index > 3 ? false : true
  end

end
