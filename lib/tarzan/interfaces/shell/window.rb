require 'tarzan/interfaces/base/interface'

module Tarzan
  module Interfaces
    module Shell
      class Window
        attr_accessor :alert, :buttons

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
          puts message
        end

        def prompt(valid_choices = [])
          say %{Pick one: #{valid_choices.keys.join ' - '} }
          choice = gets.strip
          valid_choices.select{|k,v| k.to_s == choice}.values.first || prompt(valid_choices)
        end      
      end
    end
  end
end