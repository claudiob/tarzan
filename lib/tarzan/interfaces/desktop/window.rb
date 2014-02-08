require 'gosu'

module Tarzan
  module Interfaces
    module Desktop
      class Window < Gosu::Window
        attr_accessor :alert, :buttons

        def initialize
          super 640, 480, is_fullscreen
          self.caption = 'Game Hall'
          @font = Gosu::Font.new self, Gosu::default_font_name, 20
        end

        # This method is called once every #update_interval milliseconds while the window is being shown.
        def update
        end

        # This method is called after every update and whenever the OS wants the window to repaint itself.
        def draw
          if @alert
            @font.draw @alert, 200, 450, 2
          end
          @buttons.each.with_index do |(text, callback), i|
            draw_quad(
                 100, 30 + i*30, Gosu::Color.new(0xFF1EB1FA),
                 200, 30 + i*30, Gosu::Color.new(0xFF1EB1FA),
                 100, 50 + i*30, Gosu::Color.new(0xFF1D4DB5),
                 200, 50 + i*30, Gosu::Color.new(0xFF1D4DB5),
                 0)
            @font.draw text, 100, 30 + i*30, 2
          end if @buttons
        end

        # This method is called whenever a key is pressed down
        def button_down(id)
          case id
            when Gosu::KbEscape then close
          end
        end

        # This method is called whenever a key is pressed up
        def button_up(id)
          case id
          when Gosu::MsLeft
            @buttons.each.with_index do |(text, callback), i|
              if 30 + i*30 < mouse_y && mouse_y < 50 + i*30 && 100 < mouse_x && mouse_x < 200
                @buttons = nil
                callback.call
                break
              end
            end if @buttons
          end
        end

      private

        def is_fullscreen
          false
        end

        # [from Gosu::Window] Whether the system cursor should be shown
        def needs_cursor?
          true
        end
      end
    end
  end
end