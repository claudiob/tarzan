require 'tarzan/interfaces/base/interface'

module Tarzan
  module Interfaces
    module Shell
      class Interface < Base::Interface
        def say(message)
          puts message
        end

        def prompt(valid_choices = [])
          say %{Pick one: #{valid_choices.join ' - '} }
          choice = gets.strip
          valid_choices.include?(choice) ? choice : prompt(valid_choices)
        end
      end
    end
  end
end