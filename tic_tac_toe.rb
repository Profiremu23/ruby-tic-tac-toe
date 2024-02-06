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
    @row = 0
    @column = 0
    @character = 'X'
    @player = 'Player One'
    @turn = 1
  end

  def cell_free?(row, column)
    board_state[row][column].free?
  end

  def update_cell(row, column, symbol)
    if cell_free?(row, column)
      board_state[row][column].symbol = symbol
    else
      puts "The entered cell for row #{row} and column #{column} is already taken!"
      @turn -= 1
    end
  end

  def print_board
    print "\n| #{board_state[0][0]} | #{board_state[0][1]} | #{board_state[0][2]} |
| #{board_state[1][0]} | #{board_state[1][1]} | #{board_state[1][2]} |
| #{board_state[2][0]} | #{board_state[2][1]} | #{board_state[2][2]} |\n"
  end

  # Winning message
  def winning_message
    puts "Congratulations! #{player} won!"
  end

  # Horizontal winning patterns (primary is marked with X, secondary is with O)
  def primary_horizontal_winning_condition
    if board_state[0][0].symbol == 'X' && board_state[0][1].symbol == 'X' && board_state[0][2].symbol == 'X'
      winning_message
    elsif board_state[1][0].symbol == 'X' && board_state[1][1].symbol == 'X' && board_state[1][2].symbol == 'X'
      winning_message
    elsif board_state[2][0].symbol == 'X' && board_state[2][1].symbol == 'X' && board_state[2][2].symbol == 'X'
      winning_message
    else
      secondary_horizontal_winning_condition
    end
  end

  def secondary_horizontal_winning_condition
    if board_state[0][0].symbol == 'O' && board_state[0][1].symbol == 'O' && board_state[0][2].symbol == 'O'
      winning_message
    elsif board_state[1][0].symbol == 'O' && board_state[1][1].symbol == 'O' && board_state[1][2].symbol == 'O'
      winning_message
    elsif board_state[2][0].symbol == 'O' && board_state[2][1].symbol == 'O' && board_state[2][2].symbol == 'O'
      winning_message
    else
      primary_vertical_winning_condition
    end
  end

  # Vertical winning patterns
  def primary_vertical_winning_condition
    if board_state[0][0].symbol == 'X' && board_state[1][0].symbol == 'X' && board_state[2][0].symbol == 'X'
      winning_message
    elsif board_state[0][1].symbol == 'X' && board_state[1][1].symbol == 'X' && board_state[2][1].symbol == 'X'
      winning_message
    elsif board_state[0][2].symbol == 'X' && board_state[1][2].symbol == 'X' && board_state[2][2].symbol == 'X' 
      winning_message
    else
      secondary_vertical_winning_condition
    end
  end

  def secondary_vertical_winning_condition
    if board_state[0][0].symbol == 'O' && board_state[1][0].symbol == 'O' && board_state[2][0].symbol == 'O'
      winning_message
    elsif board_state[0][1].symbol == 'O' && board_state[1][1].symbol == 'O' && board_state[2][1].symbol == 'O'
      winning_message
    elsif board_state[0][2].symbol == 'O' && board_state[1][2].symbol == 'O' && board_state[2][2].symbol == 'O'
      winning_message
    else
      primary_diagonal_winning_condition
    end
  end

  # Diagonal winning patterns + drawing and game continuation logic
  def primary_diagonal_winning_condition
    if board_state[0][0].symbol == 'X' && board_state[1][1].symbol == 'X' && board_state[2][2].symbol == 'X'
      winning_message
    elsif board_state[2][0].symbol == 'X' && board_state[1][1].symbol == 'X' && board_state[0][2].symbol == 'X'
      winning_message
    else
      secondary_diagonal_winning_condition
    end
  end

  def secondary_diagonal_winning_condition
    if board_state[0][0].symbol == 'O' && board_state[1][1].symbol == 'O' && board_state[2][2].symbol == 'O'
      puts "Congratulations! #{player} won!"
    elsif board_state[2][0].symbol == 'O' && board_state[1][1].symbol == 'O' && board_state[0][2].symbol == 'O'
      puts "Congratulations! #{player} won!"
    else
      winless_conditions
    end
  end

  # Game continuation and drawing logic
  def winless_conditions
    if turn > 9
      puts "It's a draw!"
    else
      @turn += 1
      game_function
    end
  end
end

# Defining the game conditions
class Game < GameBoard
  def player
    if turn.odd?
      @character = 'X'
      @player = 'Player One'
    else
      @character = 'O'
      @player = 'Player Two'
    end
  end

  def row
    puts 'Please enter a number for your chosen row:'
    @row = gets.chomp.to_i
    until @row.negative? == false && @row < 3
      puts "The given value for the board's row is out of range!"
      @row = gets.chomp.to_i
    end
  end

  def column
    puts 'Please enter a number for your chosen column:'
    @column = gets.chomp.to_i
    until @column.negative? == false && @column < 3
      puts "The given value for the board's column is out of range!"
      @column = gets.chomp.to_i
    end
  end

  def game_function
    player
    puts "Turn #{@turn} for #{@player} (#{@character})"
    row
    column
    update_cell(@row, @column, @character)
    puts print_board
    primary_horizontal_winning_condition
  end
end

table = Game.new
table.game_function
