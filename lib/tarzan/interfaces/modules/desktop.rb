require_relative './interface'
require_relative './window'

module Desktop
  include Interface

  def run(options = {})
    Window.instance.show
  end

  def enqueue(message, choices = {})
    Window.instance.set_alert message
    Window.instance.set_buttons choices
  end
end
