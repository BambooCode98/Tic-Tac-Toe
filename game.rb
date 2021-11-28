class TicTacToe

    attr_accessor :board

    def initialize
        @board = ["","","","","","","","",""]
    end

    WINNING_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def board_display
        p   "#{@board[0]} | #{@board[1]} | #{board[2]}"
        p   "#{@board[3]} | #{@board[4]} | #{board[5]}"
        p   "#{@board[6]} | #{@board[7]} | #{board[8]}"
    end

    def input_to_index(input)
        index = @board[input]
        index
    end

    def move(index)
        @board[index]
    end

end


game = TicTacToe.new

p "select a cell 1-9: "
input = gets.chomp.to_i - 1

game.board_display