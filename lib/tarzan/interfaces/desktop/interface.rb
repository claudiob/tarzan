require 'tarzan/interfaces/base/interface'
require 'tarzan/interfaces/desktop/window'

module Tarzan
  module Interfaces
    module Desktop
      class Interface < Base::Interface
        def initialize(options = {})
          @window = Window.new
        end
        
        def run
          super
          @window.show
        end

        def say(message)
          @window.push_alert message
        end

        def prompt(valid_choices = [])
          say %{Pick one: #{valid_choices.join ' - '} }
        end
      end
    end
  end
end