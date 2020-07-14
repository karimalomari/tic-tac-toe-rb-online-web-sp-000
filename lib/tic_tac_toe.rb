WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 3, 6],
  [0, 4, 8],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [3, 4, 5],
  [6, 7, 8],
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i-1
end

def move (board, position, char)
  board[position] = char
end

def position_taken? (board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  elsif board[index] == "X" || board[index] == "O"
      taken = true
  end
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  userInput = gets.strip
  index = input_to_index(userInput)
  if !valid_move?(board, index)
    turn(board)
  else 
    move(board, index)
  end
  display_board(board)
end

def turn_count(board)
  count = 0
  board.each do |index|
    if index != " "
      count += 1
    end
  end
    count
 end
 
 def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end