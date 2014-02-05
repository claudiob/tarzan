require 'tarzan/games/base/game'
require 'tarzan/games/rock_paper_scissors/move'

module Tarzan
  module RockPaperScissors
    class Game < Base::Game

    private

      def rules
        'Rock beats Scissors beats Paper beats Rock'
      end

      def prompt_move
        puts %{Pick [R]ock, [P]aper, or [S]cissors: }
        hand = gets.strip
        Move.new hand: hand
      end

      def random_move
        hand = ['R', 'P', 'S'].sample
        Move.new hand: hand
      end
    end
  end
end