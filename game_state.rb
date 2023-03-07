class GameState
  attr_reader :player1, :player2, :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def next_turn
    @current_player = (@current_player == player1) ? player2 : player1
  end

  def winner
    return player2 if player1.dead?
    return player1 if player2.dead?
    nil
  end

  def game_over?
    !winner.nil?
  end

  def print_scores
    puts "P1: #{player1} vs P2: #{player2}"
    puts "----------- NEW TURN -----------"
  end
end