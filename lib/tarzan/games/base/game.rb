module Tarzan
  module Games
    module Base
      class Game
        def initialize(options = {})
          @interface = options[:interface]
        end

        def play
          @interface.set_prompt %{Rules: #{rules}}, ok: ->{prompt_move}
        end

        def prompt_move
        end

        def confirm_move(choice)
        end

        def show_outcome
          outcome = case @move_p1 <=> @move_p2
            when 1  then %{You win!}
            when -1 then %{You lose!}
            when 0  then %{It’s a tie!}
          end
          @interface.set_prompt outcome, ok: ->{@interface.game_over}
        end

      private

        def rules
          # Subclasses are expected to define rules
        end

        def random_move
        end
      end
    end
  end
end