# frozen_string_literal: true

# Defining a cell on the game board
class Cell
  attr_accessor :symbol

  def initialize
    @symbol = nil
  end

  def free?
    symbol.nil?
  end

  def to_s
    symbol || ' '
  end
end

# Creating a 3x3 game board
class GameBoard
  attr_accessor :turn
  attr_reader :board_state

  def initialize
    @board_state = Array.new(3) { Array.new(3) { Cell.new } }
    @turn = 0
    @character = 'X'
  end

  def cell_free?(row, column)
    board_state[row][column].free?
  end

  def update_cell(row, column, symbol)
    board_state[row][column].symbol = symbol
  end

  def print_board
    print "\n| #{board_state[0][0]} | #{board_state[0][1]} | #{board_state[0][2]} |
| #{board_state[1][0]} | #{board_state[1][1]} | #{board_state[1][2]} |
| #{board_state[2][0]} | #{board_state[2][1]} | #{board_state[2][2]} |\n\n"
  end

  # Horizontal winning patterns
  def horizontal_winning_condition
    if (board_state[0][0].symbol == 'X' && board_state[0][1].symbol == 'X' && board_state[0][2].symbol == 'X') || (board_state[0][0].symbol == 'O' && board_state[0][1].symbol == 'O' && board_state[0][2].symbol == 'O')
      puts 'Congratulations! You won!'
    elsif (board_state[1][0].symbol == 'X' && board_state[1][1].symbol == 'X' && board_state[1][2].symbol == 'X') || (board_state[1][0].symbol == 'O' && board_state[1][1].symbol == 'O' && board_state[1][2].symbol == 'O')
      puts 'Congratulations! You won!'
    elsif (board_state[2][0].symbol == 'X' && board_state[2][1].symbol == 'X' && board_state[2][2].symbol == 'X') || (board_state[2][0].symbol == 'O' && board_state[2][1].symbol == 'O' && board_state[2][2].symbol == 'O')
      puts 'Congratulations! You won!'
    else
      puts self.vertical_winning_condition
    end
  end

  # Vertical winning patterns
  def vertical_winning_condition
    if (board_state[0][0].symbol == 'X' && board_state[1][0].symbol == 'X' && board_state[2][0].symbol == 'X') || (board_state[0][0].symbol == 'O' && board_state[1][0].symbol == 'O' && board_state[2][0].symbol == 'O')
      puts 'Congratulations! You won!'
    elsif (board_state[0][1].symbol == 'X' && board_state[1][1].symbol == 'X' && board_state[2][1].symbol == 'X') || (board_state[0][1].symbol == 'O' && board_state[1][1].symbol == 'O' && board_state[2][1].symbol == 'O')
      puts 'Congratulations! You won!'
    elsif (board_state[0][2].symbol == 'X' && board_state[1][2].symbol == 'X' && board_state[2][2].symbol == 'X') || (board_state[0][2].symbol == 'O' && board_state[1][2].symbol == 'O' && board_state[2][2].symbol == 'O')
      puts 'Congratulations! You won!'
    else
      puts self.diagonal_winning_condition
    end
  end

  # Diagonal winning patterns + drawing and game continuation logic
  def diagonal_winning_condition
    if (board_state[0][0].symbol == 'X' && board_state[1][1].symbol == 'X' && board_state[2][2].symbol == 'X') || (board_state[0][0].symbol == 'O' && board_state[1][1].symbol == 'O' && board_state[2][2].symbol == 'O')
      puts 'Congratulations! You won!'
    elsif (board_state[2][0].symbol == 'X' && board_state[1][1].symbol == 'X' && board_state[0][2].symbol == 'X') || (board_state[2][0].symbol == 'O' && board_state[1][1].symbol == 'O' && board_state[0][2].symbol == 'O')
      puts 'Congratulations! You won!'
    elsif turn > 9
      puts "It's a draw!"
    else
      puts 'Game continues!'
      @turn = turn + 1
    end
  end
end

# Defining the game conditions
class Game < GameBoard
  def current_player
    if turn.odd?
      character = 'X'
    else
      character = 'O'
    end
  end
end

table = Game.new
table.update_cell(0, 0, 'X')
table.print_board
table.update_cell(0, 1, 'X')
table.update_cell(0, 2, 'X')
table.print_board
table.horizontal_winning_condition
