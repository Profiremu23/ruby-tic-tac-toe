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
    if board_state[0][0] == 'X' &&  board_state[0][1] == 'X' && board_state[0][2] == 'X'
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
p table.cell_free?(0, 0)
table.update_cell(0, 0, 'X')
table.print_board
p table.cell_free?(0, 0)
table.update_cell(0, 1, 'X')
table.update_cell(0, 2, 'X')
table.print_board
table.winning_condition
