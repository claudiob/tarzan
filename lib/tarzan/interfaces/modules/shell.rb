require_relative './interface'

module Shell
  include Interface

  def run(options = {})
    while action = (@actions ||= []).shift
      say action[:message]
      choose(action[:choices]).call
      run
    end
  end

  def enqueue(message, choices = {})
    (@actions ||= []).push message: message, choices: choices
  end

  def say(message)
    puts message
  end

  def choose(choices = {})
    if choices[:next]
      sleep 0.2
      choices[:next]
    else
      say %{Pick one: #{choices.keys.join ' - '} }
      choice = gets.strip
      choices.select{|k,v| k.to_s == choice}.values.first || prompt(choices)
    end
  end
end
