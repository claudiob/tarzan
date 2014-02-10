require 'tarzan/loop'

module Tarzan
  module Tournament
    include Loop

    def welcome
      say %{Welcome}, next: ->{select_game}
    end

    def select_game
      ask %{Pick a game}, loaded_games
    end

    def loaded_games
      Dir[File.dirname(__FILE__) + '/games/*.rb'].each {|file| require file }

      {exit: -> {goodbye}}.tap do |games|
        ObjectSpace.each_object(Game) do |game|
          unless game == Tarzan::Game
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
end