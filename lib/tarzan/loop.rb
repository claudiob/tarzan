module Tarzan
  module Loop
    def self.included(base)
      base.extend base
    end

    def run(interface, options = {})
      @interface ||= interface
      @options ||= options
      welcome
      catch(:exit) { @interface.run @options }
    end

    def welcome
      say %{Welcome}, next: ->{goodbye}
    end

    def goodbye
      say %{Goodbye}, next: ->{exit}
    end

    def exit
      throw :exit
    end

    def say(message, choices = {})
      @interface.enqueue message, choices
    end
    alias :ask :say
  end
end