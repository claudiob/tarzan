require 'tarzan/game'

module Tarzan
  module OddsAndEvens
    include Game

    def rules
      'Odd sum wins, even sum loses'
    end

    def moves
      {'1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5}
    end

    def compare_moves(move_a, move_b)
      case move_a + move_b # might need finger_offset
        when ->(sum) { sum.odd? } then 1
        when ->(sum) { sum.even? } then -1
      end
    end
  end
end