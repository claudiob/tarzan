require 'tarzan/games/base/game'
require 'tarzan/games/odds_and_evens/move'

module Tarzan
  module OddsAndEvens
    class Game < Base::Game

    private

      def rules
        'Odd sum wins, even sum loses'
      end

      def prompt_move
        puts %{Pick a number of fingers among [1], [2], [3], [4], and [5]: }
        fingers = gets.strip.to_i
        Move.new fingers: fingers, wins_on_odds: true
      end

      def random_move
        fingers = (1..5).to_a.sample
        Move.new fingers: fingers, wins_on_odds: false
      end
    end
  end
end