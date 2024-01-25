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
    print "\n| #{board_state[0][0]} | #{board_state[0][1]} | #{board_state[0][2]} |\n| #{board_state[1][0]} | #{board_state[1][1]} | #{board_state[1][2]} |\n| #{board_state[2][0]} | #{board_state[2][1]} | #{board_state[2][2]} |\n"
  end
end

table = GameBoard.new
table.cell_free?(0, 1)
table.update_cell(0, 1, 'X')
table.cell_free?(0, 1)
table.print_board
