require 'tarzan/games/rock_paper_scissors/game'
require 'tarzan/games/odds_and_evens/game'

module Tarzan
  def self.play
    puts %{Welcome to the Game Hall}

    puts %{Pick [R]ockPaperScissors or [O]ddsAndEvens: }
    game = case gets.strip
      when 'R' then RockPaperScissors::Game.new
      when 'O' then OddsAndEvens::Game.new
    end

    game.play

    puts %{Goodbye, and come back to the Game Hall}
  end
end