require_relative './interface'
require 'nico'
require 'net/http'

module Campfire
  include Interface

  def run(options = {})
    @room ||= Nico::Room.new options
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
    @room.say message
  end

  def choose(choices = {})
    if choices[:next]
      sleep 0.2
      choices[:next]
    else
      say %{Pick one: #{choices.keys.join ' - '} }
      @room.each_message do |message|
        choice = choices.select{|k,v| k.to_s == message}.values.first
        return choice if choice
      end
    end
  end
end