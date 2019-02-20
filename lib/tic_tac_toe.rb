WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  puts "-----------"
end

def input_to_index(user_input)
  user_input.to_i-1
end

def move(board, position, player_token)
  board[position] = player_token
end

def position_taken?(board, position)
  !(board[position] == " " || board[position].nil?)
end

def valid_move?(board, position)
  !(position > 8 || position < 0) && !position_taken?(board, position)
end

def turn_count(board)
  number_turn = 0
  board.each { |position|
    if position == "X" || position == "O"
      number_turn += 1
    end
  }
  return number_turn
end

def current_player(board)
  turns = turn_count(board)
  if turn % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
end

def turn(board)
  puts "Please choose a position 1-9."
  user_input = gets.chomp
  position = input_to_index(user_input)
  if valid_move?(board, position)
    player_token = player_token(board)
    move(board, position, player_token)
    display_board(board)
  else
    turn(board)
  end
end
