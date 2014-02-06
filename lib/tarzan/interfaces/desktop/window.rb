require 'gosu'

module Tarzan
  module Interfaces
    module Desktop
      class Window < Gosu::Window
        def initialize
          super 640, 480, is_fullscreen
          self.caption = 'Game Hall'
          @font = Gosu::Font.new self, Gosu::default_font_name, 20
          @alerts = []
        end

        def push_alert(message)
          @alerts.push message
        end

        def pop_alert
          @alerts.shift
        end

        # This method is called once every #update_interval milliseconds while the window is being shown.
        def update
        end

        # This method is called after every update and whenever the OS wants the window to repaint itself.
        def draw
          @font.draw @alerts.first, 200, 450, 2 if @alerts.any?
        end

        # This method is called whenever a key is pressed down
        def button_down(id)
          case id
            when Gosu::KbEscape then close
            when Gosu::KbReturn then pop_alert
          end
        end

      private

        def is_fullscreen
          false
        end
      end
    end
  end
end