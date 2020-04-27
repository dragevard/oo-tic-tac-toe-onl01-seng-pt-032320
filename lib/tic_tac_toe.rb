class TicTacToe 
  
  def initialize
    @board = Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1 
  end 
  
  def move(index, token = "X")
    @board[index] = token 
  end 
  
  def position_taken?(index)
    if (@board[index] == "X" || @board[index] == "O")
      true
    else
      false
    end
  end
  
  def valid_move?(index)
    if (position_taken?(index) || index < 0 || index > 8)
      false
    else
      true
    end
  end 
  
  def current_player 
    if turn_count % 2 == 0 
      "X"
    else
      "O"
    end
  end
  
  def turn 
    puts "PLease enter a position from (1-9)"
    input = gets
    index = input_to_index(input)
    if valid_move?(index) 
      token = current_player
      move(index, token)
      display_board
    else 
      turn
    end 
  end
  
  def turn_count 
    @board.count do |turn|
      turn == "X" || turn == "O"
    end
  end
  

  
  def won?
    WIN_COMBINATIONS.each do |win|
        position_0 = @board[win[0]]
        position_1 = @board[win[1]]
        position_2 = @board[win[2]]
        if position_0 == "X" && position_1 == "X" && position_2 == "X"
          return win
        elsif position_0 == "O" && position_1 == "O" && position_2 =="O"
          return win
        end
    end
    false
  end
  
  def full?
    @board.all? do |token|
      token == "X" || token == "O"
    end
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if won?
      @board[won?[0]]
    end
  end
  
  def play 
    turn until over?
    # winner ? "Congratulations #{winner}!" : "Cat's Game!"
    # test-expression ? if-true-expression : if-false-expression
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end 
    
  end 
    
end 