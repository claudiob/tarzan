require 'tarzan/interfaces/base/interface'
require 'tarzan/interfaces/shell/window'

module Tarzan
  module Interfaces
    module Shell
      class Interface < Base::Interface
        def initialize(options = {})
          @window = Window.new
        end
      end
    end
  end
end