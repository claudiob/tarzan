
module Interface
  def self.included(base)
    base.extend base
  end

  def run(options = {})
  end

  def enqueue(message, choices = {})
  end
end