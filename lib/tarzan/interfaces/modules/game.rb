require_relative './loop'

module Game
  include Loop

  def self.included(base)
    base.extend base
  end

  def welcome
    say %{Rules: #{rules}}, next: ->{prompt_move}
  end

  def rules
    '[no rules defined]'
  end

  def moves
    {}
  end

  def prompt_move
    ask %{Choose a move}, Hash[*moves.map{|k, v| [k, ->{choose v}]}.flatten]
  end

  def choose(choice)
    @move_p1 = choice
    @move_p2 = random_move
    say %{You played #{@move_p1} - I played #{@move_p2}}, next: ->{show_outcome}
  end

  def random_move
    moves.values.sample
  end

  def show_outcome
    outcome = case compare_moves(@move_p1, @move_p2)
      when 1  then %{You win!}
      when -1 then %{You lose!}
      when 0  then %{It’s a tie!}
    end
    say outcome, next: ->{exit}
  end

  def compare_moves(move_a, move_b)
    move_a <=> move_b
  end
end