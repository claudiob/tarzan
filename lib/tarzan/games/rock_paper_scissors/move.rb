module Tarzan
  module Games
    module RockPaperScissors
      class Move
        attr_reader :choice

        def self.valid
          ['R', 'P', 'S']
        end

        def initialize(options = {})
          @choice = options[:choice]
        end

        def <=>(another)
          case "#{choice}#{another.choice}"
            when 'RS', 'SP', 'PR' then 1
            when 'RP', 'SR', 'PS' then -1
            else 0
          end
        end

        def to_s
          "#{@choice}"
        end
      end
    end
  end
end