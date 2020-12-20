class TicTacToe
attr_accessor :board
WIN_COMBINATIONS = [[0,1,2],
                    [3,4,5],
                    [6,7,8],
                    [0,3,6],
                    [1,4,7],
                    [2,5,8],
                    [0,4,8],
                    [2,4,6]]

def initialize
    @board = Array.new(9, " ")
end

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(x)
    x.to_i - 1

end
def move(spot,token= "X")
    @board[spot]=token
end

def position_taken?(spot)
    @board[spot] != " "
end

def valid_move?(spot)
    !position_taken?(spot) && spot.between?(0,8)
end

def turn_count
    count = 0
    @board.each do |x|
        if x != " "
            count +=1
        end
    end
    count
end

def current_player
    if turn_count.odd?
        return "O"
    else
        return "X"
    end
    
end
def turn
=begin
    ask for input
get input
translate input into index
if index is valid
  make the move for index
  show the board
else
  restart turn
end 
=end
puts "Please choose where you would like to go by picking a number between 1-9."
user_in = gets.strip
index_num = input_to_index(user_in)
check = valid_move?(index_num)
if check == true
    piece = current_player
    move(index_num,piece)
    display_board
else
    turn
end
end

def won?
    WIN_COMBINATIONS.any? do |x|
        if position_taken?(x[0]) && @board[x[0]] == @board[x[1]] && @board[x[1]] == @board[x[2]]
          return x
        end
    end
    
end

def full?
    @board.all?{|x| x != " " }

end

def draw?
    if full? && !won?
        true
    else
        false
    end

end

def over?
    if draw? || won?
        true
    else
        false
    end


end

def winner
    if x = won?
        @board[x[0]]
      end

end

def play
    turn until over?
    puts winner ? "Congratulations " "#{winner}" "!" : "Cat's Game!"
    

end
end
