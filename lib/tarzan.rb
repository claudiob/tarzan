module Tarzan
  def self.play!
    puts %{Welcome to the Game Hall}

    puts %{Let’s play Rock Paper Scissors}

    puts %{Pick [R]ock, [P]aper, or [S]cissors: }

    move_p1 = gets.strip
    move_p2 = ['R', 'P', 'S'].sample

    puts %{You played #{move_p1} - I played #{move_p2}}

    case "#{move_p1}#{move_p2}"
      when 'RS', 'SP', 'PR' then puts %{You win!}
      when 'RP', 'SR', 'PS' then puts %{You lose!}
      when 'RR', 'SS', 'PP' then puts %{It’s a tie!}
    end

    puts %{Goodbye, and come back to the Game Hall}
  end
end