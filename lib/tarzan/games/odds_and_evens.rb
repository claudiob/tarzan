module Tarzan
  module OddsAndEvens
    def self.play
      puts %{Rules: Odd sum wins, even sum loses}

      puts %{Pick a number of fingers among [1], [2], [3], [4], and [5]: }

      move_p1 = gets.strip
      move_p2 = ['1', '2', '3', '4', '5'].sample

      puts %{You played #{move_p1} - I played #{move_p2}}

      case (move_p1.to_i + move_p2.to_i)
        when ->(sum) { sum.odd? } then puts %{You win!}
        when ->(sum) { sum.even? } then puts %{You lose!}
        else %{It’s a tie!}
      end
    end
  end
end
