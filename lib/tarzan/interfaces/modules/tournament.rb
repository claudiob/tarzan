require_relative './loop'
require_relative './rock_paper_scissors'
require_relative './odds_and_evens'

module Tournament
  include Loop

  def welcome
    say %{Welcome}, next: ->{select_game}
  end

  def select_game
    ask %{Pick a game}, loaded_games
  end

  def loaded_games
    {exit: -> {goodbye}}.tap do |games|
      ObjectSpace.each_object(Game) do |game|
        unless game == Game
          games[game.to_s] = ->{play game}
        end
      end
    end
  end

  def play(game)
    game.run @interface, @options
    say %{Get ready for the next one}, next: ->{select_game}
  end
end