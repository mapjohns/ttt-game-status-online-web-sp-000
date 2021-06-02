# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[6,4,2]]

def won?(board)
  end_result = []
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
   
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3
   
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      end_result.append("win!")
      return win_combination # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      end_result.append("win!")
      return win_combination
    end
  end
  if end_result[0] != "win!"
    return false
  end 
end

def full?(board)
  if board.include?(" ") == true
    return false
  else 
    return true
  end
end

def draw?(draw_board)
  if won?(draw_board) == false && full?(draw_board) == true #Board not won, but full
    return true
  elsif won?(draw_board) == false && full?(draw_board) == false #Board not won, board not full
    return false
  elsif won?(draw_board) != false #Board is won
    return false
  end
end 

def over?(board)
  if draw?(board) == true || won?(board) != false || full?(board) == true
    return true
  else
    return false
  end
end 

def winner(board)
  win_comb = []
  win_comb = won?(board)
  if win_comb == false
    return nil
  elsif board[win_comb[0]] == 'X'
    return 'X'
  elsif board[win_comb[0]] == 'O'
    return 'O'
  end
end 
