require 'tarzan/games/rock_paper_scissors'
require 'tarzan/games/odds_and_evens'

module Tarzan
  def self.play
    puts %{Welcome to the Game Hall}

    puts %{Pick [R]ockPaperScissors or [O]ddsAndEvens: }
    game = gets.strip

    case game
      when 'R' then RockPaperScissors.play
      when 'O' then OddsAndEvens.play
    end

    puts %{Goodbye, and come back to the Game Hall}
  end
end