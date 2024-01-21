class Board
  def board_assembler
    p Array.new(3, " ") { Array.new(3, " ")}
  end
end

board = Board.new.board_assembler
p board[0][1] = "X"
p board[1][0] = "O"
p board