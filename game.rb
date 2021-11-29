# frozen_string_literal: true

class TicTacToe
  attr_accessor :board, :turn

  def initialize
    @board = ['', '', '', '', '', '', '', '', '']
    @turn = 0
  end

  WINNING_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def board_display
    puts " #{@board[0]} | #{@board[1]} | #{board[2]} "
    puts '________'
    puts " #{@board[3]} | #{@board[4]} | #{board[5]} "
    puts '________'
    puts " #{@board[6]} | #{@board[7]} | #{board[8]} "
  end

  def input_to_index(input_number)
    input_number.to_i - 1
  end

  def move(index, player_token)
    @board[index] = player_token
  end

  def position_taken?(index)
    @board[index] == 'x' || @board[index] == 'o'
  end

  def valid_move?(index)
    if !position_taken?(index) && index.between?(0, 8)
      true
    else
      p 'position is taken, or wrong character is entered: try again'
      false
    end
  end

  def turn_count
    @turn = 0
    @board.each do |index|
      @turn += 1 if %w[x o].include?(index)
    end
    # p "Round: #{turn}"
    @turn
  end

  def current_player?
    player = ''
    if turn_count.even?
      'x'
    else
      'o'
    end
  end

  def turns
    p 'enter 1-9: '
    input_number = gets.chomp
    index = input_to_index(input_number)
    if valid_move?(index)
      move(index, current_player?)
    else
      turns
    end
    board_display
  end

  def won?
    WINNING_COMBINATIONS.detect do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] &&
        @board[win_combo[1]] == @board[win_combo[2]] &&
        position_taken?(win_combo[0])
    end
  end

  def full?
    turn_count == 9
  end

  def draw?
    if turn_count == 9 && !won?
      p 'draw'
    else
      false
    end
  end

  def over?
    p 'game over' if won? || draw? || full?
  end

  def winner?
    if won?
      p 'x won'
    else
      won?
      p 'o won'
    end
  end

  def play
    until over?
      p "Round #{@turn}"
      turns
    end

    if won?
      winner = winner?
      p "Winner is #{winner}"
    else
      draw?
      p 'draw'
    end
  end
end

game = TicTacToe.new
game.play
# the above goes in a class method turn or something
