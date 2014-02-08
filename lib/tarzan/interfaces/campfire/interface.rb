require 'tarzan/interfaces/base/interface'
require 'tarzan/interfaces/campfire/window'

module Tarzan
  module Interfaces
    module Campfire
      class Interface < Base::Interface
        def initialize(options = {})
          @window = Window.new options
        end
      end
    end
  end
end