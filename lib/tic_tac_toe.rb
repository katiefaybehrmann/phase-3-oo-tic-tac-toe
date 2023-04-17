require "pry"

class TicTacToe

    attr_accessor :board

    WIN_COMBINATIONS = [
        [0, 1, 2], 
        [3, 4, 5],
        [6, 7, 8], 
        [0, 3, 6], 
        [1, 4, 7], 
        [2, 5, 8], 
        [0, 4, 8],
        [2, 4, 6]
    ]

    def initialize
        @board=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts " #{self.board[0]} | #{self.board[1]} | #{self.board[2]} "
        puts "-----------"
        puts " #{self.board[3]} | #{self.board[4]} | #{self.board[5]} "
        puts "-----------"
        puts " #{self.board[6]} | #{self.board[7]} | #{self.board[8]} "
    end

    def input_to_index position
        position.to_i - 1
    end

    def move (i, token="X")
        self.board[i].replace(token)
    end

    def position_taken? (index)
        self.board[index] != " "
    end

    def valid_move? (index)
        index >= 0 && index < 10 && !position_taken?(index)
    end

    def turn_count
        turns = self.board.select { |e| e != " "}
        turns.length
    end

    def current_player
        xs = self.board.select {|e| e=="X"}
        os = self.board.select {|e| e=="O"}

        if xs.count == os.count
            "X"
        else
            "O"
        end
    end

    def turn
        puts "Choose 1-9"
        player_position = gets
        index1 = input_to_index(player_position)
        token1 = current_player
        if valid_move?(index1)
            self.move(index1, token1)
            display_board
        else
            turn
        end
    end

    def won?
        win = nil

        WIN_COMBINATIONS.each do |e|
            if self.board[e[0]] == self.board[e[1]] && self.board[e[1]] == self.board[e[2]] && self.board[e[0]] != " "
                win = e 
            else
                win
            end
        end

        if win == nil
            false
        else
            win
        end
    end

    def full?
        !self.board.include?(" ")
    end

    def draw?
        if !self.won? && self.full?
            true
        else
            false
        end
    end

    def over?
        if self.won? || self.draw?
            true
        else
            false
        end
    end

    def winner
        if self.won?
            board[self.won?[0]]
        else
            nil
        end
    end

    def play
        until self.over?
            self.turn
        end

        if self.won?
            puts "Congratulations #{self.winner}!"
        else
            puts "Cat\'s Game!"
        end
    end

end