class TicTacToe
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

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

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(i)
    value = false
    if @board[i] == "X"
      value = true
    elsif @board[i] == "O"
      value = true
    end
    value
  end

  def valid_move?(i)
    valid = true
    if i > 9 || i < 0
      valid = false
    elsif @board[i] == "X"
      valid = false
    elsif @board[i] == "O"
      valid = false
    end
    valid
  end

  def turn_count
    count = 0
    @board.count{|x| x == "X" || x == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "make your move 1-9"
    input = gets.to_i - 1
    input_to_index(input)
    pawn = current_player
    if valid_move?(input) == true
      move(input, pawn)
      display_board
    else
      puts "invalid move try again"
      input = gets.to_i - 1
    end
  end

  def won?
    x_win = WIN_COMBINATIONS.find(ifnone = nil) do |combo|
        @board[combo[0]] == "X" &&
        @board[combo[1]] == "X" &&
        @board[combo[2]] == "X"
      end
    o_win = WIN_COMBINATIONS.find(ifnone = nil) do |combo|
        @board[combo[0]] == "O" &&
        @board[combo[1]] == "O" &&
        @board[combo[2]] == "O"
      end
    x_win || o_win
  end

  def full?
    value = true
    if @board.include?(" ")
      value = false
    end
    value
  end

  def draw?
    value = false
    if full? && !won?
      value = true
    end
    value
  end

  def over?
    draw? || won?
  end

  def winner
    champion = nil
    x_win = WIN_COMBINATIONS.find(ifnone = nil) do |combo|
        @board[combo[0]] == "X" &&
        @board[combo[1]] == "X" &&
        @board[combo[2]] == "X"
      end
    o_win = WIN_COMBINATIONS.find(ifnone = nil) do |combo|
        @board[combo[0]] == "O" &&
        @board[combo[1]] == "O" &&
        @board[combo[2]] == "O"
      end
      if x_win
        champion = "X"
      elsif o_win
        champion = "O"
      end
    champion
  end

  def play
    until over?
      turn
    end
    if won?
 HEAD
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"

      puts "Congrats you are the champion"
    else
      puts "the game ended in a draw"
    end
  end


end
