module Tarzan
  module OddsAndEvens
    class Move
      attr_reader :fingers

      def initialize(options = {})
        @wins_on_odds = options[:wins_on_odds]
        @fingers = options[:fingers]
      end

      def <=>(another)
        case fingers + another.fingers + finger_offset
          when ->(sum) { sum.odd? } then 1
          when ->(sum) { sum.even? } then -1
          else 0 # impossible :)
        end
      end

      def to_s
        "#{@fingers}"
      end

    private

      def finger_offset
        @wins_on_odds ? 0 : 1
      end
    end
  end
end