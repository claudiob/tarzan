require 'tarzan/games/base/game'
require 'tarzan/games/rock_paper_scissors/move'

module Tarzan
  module Games
    module RockPaperScissors
      class Game < Base::Game

      private

        def rules
          'Rock beats Scissors beats Paper beats Rock'
        end

        def prompt_move
          choice = @interface.prompt Move.valid
          Move.new choice: choice
        end

        def random_move
          choice = Move.valid.sample
          Move.new choice: choice
        end
      end
    end
  end
end