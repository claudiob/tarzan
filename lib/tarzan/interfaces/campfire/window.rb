require 'nico'

module Tarzan
  module Interfaces
    module Campfire
      class Window
        attr_accessor :alert, :buttons

        def initialize(options = {})
          @room = Nico::Room.new options
        end

        def show
          if @alert
            say @alert
            @alert = nil
          end
          if @buttons
            callback = prompt @buttons
            callback.call
          end
          show
        end

      private

        def say(message)
          @room.say message
        end

        def prompt(valid_choices = [])
          say %{Pick one: #{valid_choices.keys.join ' - '} }
          @room.each_message do |message|
            choice = valid_choices.select{|k,v| k.to_s == message}.values.first
            return choice if choice
          end
        end
      end
    end
  end
end