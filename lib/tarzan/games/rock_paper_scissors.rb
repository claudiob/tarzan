module Tarzan
  module RockPaperScissors
    def self.play
      puts %{Rules: Rock beats Scissors beats Paper beats Rock}

      puts %{Pick [R]ock, [P]aper, or [S]cissors:}

      move_p1 = gets.strip
      move_p2 = ['R', 'P', 'S'].sample

      puts %{You played #{move_p1} - I played #{move_p2}}

      case "#{move_p1}#{move_p2}"
        when 'RS', 'SP', 'PR' then puts %{You win!}
        when 'RP', 'SR', 'PS' then puts %{You lose!}
        else %{It’s a tie!}
      end
    end
  end
end
