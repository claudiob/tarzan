require 'tarzan/games/base/game'
require 'tarzan/games/odds_and_evens/move'

module Tarzan
  module Games
    module OddsAndEvens
      class Game < Base::Game

      private

        def rules
          'Odd sum wins, even sum loses'
        end

        def prompt_move
          choice = @interface.prompt(Move.valid).to_i
          Move.new choice: choice, wins_on_odds: true
        end

        def random_move
          choice = Move.valid.sample
          Move.new choice: choice, wins_on_odds: false
        end
      end
    end
  end
end