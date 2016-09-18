require 'redis'
require 'json'
require_relative 'snippet'

class NetworkApplication

  attr_accessor :user

  def initialize
    @user = user
    @hostnames = []
    @r = Redis.new
  end

  def add_hostname(*host)
    host.each do |f|
      @hostnames << f
    end
  end

  def snippet(snippetName, func)
    snippetName = snippetName
    snippetUsername = @user
    snippetCommand = func
    snippetHostnames = @hostnames
    @r.set "#{snippetName}", ["#{snippetUsername}", "#{snippetCommand}", "#{snippetHostnames}"].to_json
  end
  
  def get_snippet(snippetName)
    snippet = JSON.parse(@r.get("#{snippetName}"))
    @username = "username: #{snippet[0]}"
    @command = "command: #{snippet[1]}"
    @hostnames = "hostnames: #{snippet[2]}"
  end

  def create_snippet
    @name = @user
  end

  def show
    @r.smembers
  end

end

