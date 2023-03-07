require_relative 'players'
require_relative 'question'
require_relative 'game_state'

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @state = GameState.new(@player1, @player2)
  end

  def play
    loop do
      question = Question.new
      puts "#{current_player.name}: #{question}"
      answer = gets.chomp.to_i
      if question.correct?(answer)
        puts "YES! You are correct."
      else
        puts "Seriously? NO!"
        state.current_player.lose_life
      end
      state.print_scores
      if state.game_over?
        puts "#{state.winner.name} wins with a score of #{state.winner.score}/3"
        puts "------------ GAME OVER -------------"
        puts "Good bye!"
        break
      end
      state.next_turn
    end
  end

  private

  attr_reader :state

  def current_player
    state.current_player
  end
end

game = Game.new
game.play