require_relative './game'

module RockPaperScissors
  include Game

  def rules
    'Rock beats Scissors beats Paper beats Rock'
  end

  def moves
    {rock: 'R', paper: 'P', scissors: 'S'}
  end

  def compare_moves(move_a, move_b)
    case "#{move_a}#{move_b}"
      when 'RS', 'SP', 'PR' then 1
      when 'RP', 'SR', 'PS' then -1
      else 0
    end
  end
end