require 'tarzan/games/rock_paper_scissors/game'
require 'tarzan/games/odds_and_evens/game'

module Tarzan
  module Interfaces
    module Base
      class Interface
        def play
          say %{Welcome to the Game Hall}

          say %{Pick [R]ockPaperScissors or [O]ddsAndEvens: }

          game = case prompt(['R', 'O'])
            when 'R' then Tarzan::Games::RockPaperScissors::Game.new interface: self
            when 'O' then Tarzan::Games::OddsAndEvens::Game.new interface: self
          end

          game.play

          say %{Goodbye, and come back to the Game Hall}
        end

        def say(message)
          # Subclasses are expected to define how to say messages
        end

        def prompt(valid_choices = [])
          # Subclasses are expected to define how to prompt messages
        end
      end
    end
  end
end