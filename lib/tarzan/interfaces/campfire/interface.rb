require 'tarzan/interfaces/base/interface'
require 'nico'

module Tarzan
  module Interfaces
    module Campfire
      class Interface < Base::Interface

        def initialize(options = {})
          @room = Nico::Room.new options
        end

        def say(message)
          @room.say message
        end

        def prompt(valid_choices = [])
          say %{Pick one: #{valid_choices.join ' - '} }
          @room.each_message do |message|
            return message if valid_choices.include?(message)
          end
        end
      end
    end
  end
end