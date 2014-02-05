module Tarzan
  module RockPaperScissors
    class Move
      attr_reader :hand

      def initialize(options = {})
        @hand = options[:hand]
      end

      def <=>(another)
        case "#{hand}#{another.hand}"
          when 'RS', 'SP', 'PR' then 1
          when 'RP', 'SR', 'PS' then -1
          else 0
        end
      end

      def to_s
        "#{@hand}"
      end
    end
  end
end