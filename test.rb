require 'redis'
require 'json'

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

  def snippet(func)
    snippetUsername = @user
    snippetCommand = func
    snippetHostnames = @hostnames
    # @r.set("#{@snippetUsername}#{@snippetCommand}", ['snippetUsername', "#{@snippetUsername}"])
    # @r.get("#{@snippetUsername}#{@snippetCommand}")
    @r.set "#{snippetUsername}#{snippetCommand}", ["#{snippetUsername}", "#{snippetCommand}", "#{snippetHostnames}"].to_json
    # @r.get("#{snippetUsername}#{snippetCommand}")
    # JSON.parse(@r.get("#{snippetUsername}#{snippetCommand}")).each do |f|
    #   # puts "username: #{f[0]}"
    #   # puts "command: #{f[1]}"
    #   # puts "hostnames: #{f[2]}"
    #   puts f
    # end
    snippet = JSON.parse(@r.get("#{snippetUsername}#{snippetCommand}"))
      puts "username: #{snippet[0]}"
      puts "command: #{snippet[1]}"
      puts "hostnames: #{snippet[2]}"
  end

  def create_snippet
    @name = @user
  end

  def show
    @r.smembers
  end

end
