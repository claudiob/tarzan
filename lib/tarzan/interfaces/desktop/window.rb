require 'singleton'
require 'gosu'

module Tarzan
  class Window < Gosu::Window
    include Singleton

    def initialize
      super 640, 480, is_fullscreen
      self.caption = 'Game Hall'
      @font = Gosu::Font.new self, Gosu::default_font_name, 20
    end

    def set_alert(message)
      @alert = message
    end

    def set_buttons(choices = {})
      @buttons = choices.map.with_index do |(key, value), index|
        {timeout: Time.now + 1.2, label: key, action: value, x1: 100, x2: 200, y1: 30+index*30, y2: 50+index*30}
      end
    end

    # This method is called once every #update_interval milliseconds while the window is being shown.
    def update
      @buttons.each do |button, index|
        if button[:timeout] < Time.now && button[:label] == :next
          @buttons = nil
          button[:action].call
          break
        end
      end if @buttons
    end

    def draw_text(text)
      @font.draw @alert, 200, 450, 2 # TO DO: center the text
    end

    def draw_rectangle(button)
      c1, c2 = [Gosu::Color.new(0xFF1EB1FA), Gosu::Color.new(0xFF1D4DB5)]
      x1, x2, y1, y2 = [button[:x1], button[:x2], button[:y1], button[:y2]]
      z_index = 0
      draw_quad x1, y1, c1, x2, y1, c1, x1, y2, c2, x2, y2, c2, z_index
    end

    def draw_buttons(buttons)
      buttons.reject{|button| button[:label] == :next}.each do |button|
        draw_rectangle button
        @font.draw button[:label], button[:x1], button[:y1], 2
      end
    end

    # This method is called after every update and whenever the OS wants the window to repaint itself.
    def draw
      draw_text @alert if @alert
      draw_buttons @buttons if @buttons
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
        @buttons.each do |button, index|
          if button[:y1] < mouse_y && mouse_y < button[:y2] && button[:x1] < mouse_x && mouse_x < button[:x2]
            @buttons = nil
            button[:action].call
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