module Tarzan
  module Games
    module OddsAndEvens
      class Move
        attr_reader :choice

        def self.valid
          ('1'..'5').to_a
        end

        def initialize(options = {})
          @wins_on_odds = options[:wins_on_odds]
          @choice = options[:choice]
        end

        def <=>(another)
          case choice.to_i + another.choice.to_i + finger_offset
            when ->(sum) { sum.odd? } then 1
            when ->(sum) { sum.even? } then -1
            else 0 # impossible :)
          end
        end

        def to_s
          "#{@choice}"
        end

      private

        def finger_offset
          @wins_on_odds ? 0 : 1
        end
      end
    end
  end
end