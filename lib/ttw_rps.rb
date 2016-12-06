require "ttw_rps/version"

module TtwRps

class RockPaperScissors

  def initialize
    @win_options = [["paper","rock"], ["rock","scissors"], ["scissors","paper"]]
  end

  def play
    intro
    if computer_mode?
      @player1 = Player.new(true)
      @player2 = Player.new
    else
      @player1 = Player.new(true)
      @player2 = Player.new(true)
    end
    player1_move = @player1.throw(1)
    player2_move = @player2.throw(2)
    result(player1_move, player2_move)
  end

  def intro
    print "\n\n\n"
    puts "Rock, Paper, Scissors!!"
    puts
  end

  def computer_mode?
    loop do
      puts "If this is a 2-player game, please enter 'a'."
      puts "Otherwise, enter 'b' if you're playing against the computer."
      mode = gets.chomp
      if mode == "a"
        return false
      elsif mode == "b"
        return true
      end
    end
  end

  def result(move1, move2)
    if @win_options.include?([move1, move2])
      puts "Player 1 wins!"
      binding.pry
    elsif @win_options.include?([move2, move1])
      puts "Player 2 wins!"
    elsif move1 == move2
      puts "It's a tie!"
    end
    puts "\n\n\n"
  end
end

class Player

  def initialize(human=false)
    @human = human
    @choices = %w(rock paper scissors)
  end


  def throw(num)
    if @human
      loop do
        puts 
        puts "Rock, paper, scissors..."
        print "Player #{num}> "
        move = gets.chomp.downcase.gsub(/\s+/, "")
        if @choices.include?(move)
          return move
        else
          puts "Please submit rock, paper, or scissors."
        end
      end
    else
      move = @choices.sample
      puts "Player 2 threw #{move}!"
      puts
      move
    end
  end

end

end
