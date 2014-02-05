module Tarzan
  module Games
    module Base
      class Game
        def initialize(options = {})
          @interface = options[:interface]
        end

        def play
          @interface.say %{Rules: #{rules}}

          move_p1 = prompt_move
          move_p2 = random_move

          @interface.say %{You played #{move_p1} - I played #{move_p2}}

          outcome = case move_p1 <=> move_p2
            when 1  then %{You win!}
            when -1 then %{You lose!}
            when 0  then %{It’s a tie!}
          end

          @interface.say outcome
        end

      private

        def rules
          # Subclasses are expected to define rules
        end

        def prompt_move
          # Subclasses are expected to define how to prompt the user for a move
        end

        def random_move
          # Subclasses are expected to define how to get a random move
        end
      end
    end
  end
end