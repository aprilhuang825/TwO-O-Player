require_relative './player'
require_relative './question'

class Game
  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [@player1, @player2].shuffle
  end

  def get_current_player
    @players.first
  end

  def get_new_question(player)
    question = Question.new
    question.new_question(player)
  end
  
  def show_stats
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

  def new_turn
    puts "----- NEW TURN -----"
  end

  def winner
    @player1.is_dead? ? @player2 : @player1
  end

  def display_winner(player)
    puts "#{player.name} wins with the score of #{player.lives}"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def game_over? 
    @player1.is_dead? || @player2.is_dead?
  end

  def play
    until(game_over?) do
      current_player = get_current_player
      get_new_question(current_player)
      show_stats
      new_turn
      @players.rotate!
    end

    display_winner(winner)
  end
end