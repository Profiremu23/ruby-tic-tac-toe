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
  attr_reader :board_state

  def initialize
    @board_state = Array.new(3) { Array.new(3) { Cell.new } }
  end

  def cell_free?(row, column)
    board_state[row][column].free?
  end

  def update_cell(row, column, symbol)
    board_state[row][column].symbol = symbol
  end

  def print_board
    print "| #{board_state[0][0]} | #{board_state[0][1]} | #{board_state[0][2]} |
| #{board_state[1][0]} | #{board_state[1][1]} | #{board_state[1][2]} |
| #{board_state[2][0]} | #{board_state[2][1]} | #{board_state[2][2]} |\n\n"
  end
end

# Defining the winning conditions
class WinningConditions < GameBoard
  def winning_condition
    # Horizontal winning patterns
    if (board_state[0][0] = 'X' && board_state[0][1] = 'X' && board_state[0][2] = 'X') || (board_state[0][0] = 'O' && board_state[0][1] = 'O' && board_state[0][2] = 'O')
      puts 'Congratulations! You won!'
    elsif (board_state[1][0] = 'X' && board_state[1][1] = 'X' && board_state[1][2] = 'X') || (board_state[1][0] = 'O' && board_state[1][1] = 'O' && board_state[1][2] = 'O')
      puts 'Congratulations! You won!'
    elsif (board_state[2][0] = 'X' && board_state[2][1] = 'X' && board_state[2][2] = 'X') || (board_state[2][0] = 'O' && board_state[2][1] = 'O' && board_state[2][2] = 'O')
      puts 'Congratulations! You won!'
    # Vertical winning patterns
    elsif (board_state[0][0] = 'X' && board_state[1][0] = 'X' && board_state[2][0] = 'X') || (board_state[0][0] = 'O' && board_state[1][0] = 'O' && board_state[2][0] = 'O')
      puts 'Congratulations! You won!'
    elsif (board_state[0][1] = 'X' && board_state[1][1] = 'X' && board_state[2][1] = 'X') || (board_state[0][1] = 'O' && board_state[1][1] = 'O' && board_state[2][1] = 'O')
      puts 'Congratulations! You won!'
    elsif (board_state[0][2] = 'X' && board_state[1][2] = 'X' && board_state[2][2] = 'X') || (board_state[0][2] = 'O' && board_state[1][2] = 'O' && board_state[2][2] = 'O')
      puts 'Congratulations! You won!'
      # Diagonal winning patterns
    elsif (board_state[0][0] = 'X' && board_state[1][1] = 'X' && board_state[2][2] = 'X') || (board_state[0][0] = 'O' && board_state[1][1] = 'O' && board_state[2][2] = 'O')
      puts 'Congratulations! You won!'
    elsif (board_state[2][0] = 'X' && board_state[1][1] = 'X' && board_state[0][2] = 'X') || (board_state[2][0] = 'O' && board_state[1][1] = 'O' && board_state[0][2] = 'O')
      puts 'Congratulations! You won!'
    else
      puts "It's a draw!"
    end
  end
end

# Defining the game conditions
class Game < WinningConditions
end

table = Game.new
table.update_cell(2, 0, 'O')
table.print_board
table.update_cell(1, 1, 'O')
table.update_cell(0, 2, 'O')
table.print_board
table.winning_condition
