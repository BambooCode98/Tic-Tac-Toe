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
        p"_______"
        p   "#{@board[3]} | #{@board[4]} | #{board[5]}"
        p"_______"
        p   "#{@board[6]} | #{@board[7]} | #{board[8]}"
    end

    def input_to_index(input_number)
        input_number.to_i - 1
    end

    def move(index, player_token = "x")
        @board[index] = player_token
    end

    def position_taken?(index)
        @board[index] == "x" || @board[index] == "o"
    end

    def valid_move?(index)
        if !position_taken?(index) && index.between?(0,8)
            true
        else
            p "position is taken, or wrong character is entered: try again"
            false
        end
    end

    def turn_count(index)
        turn = 0
        @board.each do |index|
            if index == "x" || index == "o"
                turn += 1
            end
        end
        p "Round: #{turn}"
    end

    def current_player?()
        if turn_count(index) % 2 == 0
            "x"
        else
            "o"
        end
    end

    def turn
        p "enter 1-9: "
        input_number = gets.chomp
        index = input_to_index(input_number)
        if valid_move?(index)
            move(index, player_token = "x")
            turn_count(index)
            board_display()
        else
            turn()
        end
    end

    def won?
        WINNING_COMBINATIONS.each do |win_combo|
            @board[win_combo[0]] == @board[win_combo[1]] &&
            @board[win_combo[1]] == @board[win_combo[2]] &&
            position_taken?(win_combo[0])
        end
    end

    def full?
        turn_count == 9
    end

    def draw?
        if turn_count() == 9 && !won?()
            p "draw"
        else
            false
        end
    end

    def over?
        



end


game = TicTacToe.new
game.turn
# the above goes in a class method turn or something