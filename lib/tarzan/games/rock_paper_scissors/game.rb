require 'tarzan/games/base/game'
require 'tarzan/games/rock_paper_scissors/move'

module Tarzan
  module Games
    module RockPaperScissors
      class Game < Base::Game

        def prompt_move
          choices = Hash[*Move.valid.map{|move| [move, ->{confirm_move move}]}.flatten]
          @interface.set_prompt %{Choose your move}, choices
        end

        def confirm_move(choice)
          @move_p1 = Move.new choice: choice, wins_on_odds: true
          @move_p2 = random_move
          @interface.set_prompt %{You played #{@move_p1} - I played #{@move_p2}}, ok: ->{show_outcome}
        end

      private

        def random_move
          choice = Move.valid.sample
          Move.new choice: choice, wins_on_odds: false
        end

        def rules
          'Rock beats Scissors beats Paper beats Rock'
        end
      end
    end
  end
end