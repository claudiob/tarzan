require 'tarzan/games/rock_paper_scissors/game'
require 'tarzan/games/odds_and_evens/game'

module Tarzan
  module Interfaces
    module Base
      class Interface
        def run
          welcome_players
          catch(:exit) { @window.show }
        end

        def welcome_players
          set_prompt %{Welcome to the Game Hall}, ok: ->{select_game}
        end

        def select_game
          set_prompt %{Pick [R]ockPaperScissors or [O]ddsAndEvens}, r: ->{play_rps}, o: ->{play_oae}
        end

        def play_rps
          game = Tarzan::Games::RockPaperScissors::Game.new interface: self
          game.play
        end

        def play_oae
          game = Tarzan::Games::OddsAndEvens::Game.new interface: self
          game.play
        end

        def game_over
          set_prompt %{Game over!}, ok: ->{farewell_players}
        end

        def farewell_players
          set_prompt %{Goodbye, and come back to the Game Hall}, bye: ->{exit}
        end

        def exit
          throw :exit
        end

        def set_prompt(message, choices = {})
          @window.alert = message
          @window.buttons = choices
        end
      end
    end
  end
end