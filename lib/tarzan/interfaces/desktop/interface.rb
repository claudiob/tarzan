require 'tarzan/interfaces/base/interface'
require 'tarzan/interfaces/desktop/window'

module Tarzan
  module Interfaces
    module Desktop
      class Interface < Base::Interface
        def initialize(options = {})
          @window = Window.new
        end
      end
    end
  end
end