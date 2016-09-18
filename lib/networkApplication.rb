require 'net/ssh'
require_relative 'snippet'

class NetworkApplication

  attr_accessor :user, :snippet

  def initialize
    @hostnames = []
    @user = user
  end
  
  def create snippet
    

  def find_snippet(name)
    @snippet = Snippet.new
    @snippet.load_snippet(name)
  end
  
  def run(name)
    find_snippet(name)
    @snippet.hostnames.each do |host|
      ssh_start(host, @snippet.username, @snippet.function)
    end
  end
  
  def ssh_start(host, username, function)
    Net::SSH.start(host, username) do |ssh|
      hostname = ssh.exec! 'hostname'
      puts "Executing #{function} on #{hostname}..."
      ssh.open_channel do |channel|
        function(channel)
      end
      ssh.loop
    end
  end
  
  def function(channel)
    channel.exec function do |ch, success|
      abort "Error" unless success
      channel.on_data do |ch, data|
        puts "#{data}"
      end
    end
  end
  
end
