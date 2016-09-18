require 'net/ssh'
require_relative 'snippet'

class NetworkApplication

  attr_accessor :user, :snippet

  def initialize
    @hostnames = []
    @user = user
  end

  def add_hostname(*host)
    host.each do |f|
      @hostnames << f
    end
  end

  def show
    @hostnames.each do |f|
      puts f
    end
  end

  def find_snippet(name)
    @snippet = Snippet.new
    @snippet.load_snippet(name)
  end
  
  def run(name)
    find_snippet(name)
    @snippet.hostnames.each do |host|
      Net::SSH.start(host, @snippet.username) do |ssh|
        hostname = ssh.exec! 'hostname'
        puts "Executing #{@snippet.function} on #{hostname}..."
        ssh.open_channel do |channel|
          channel.exec @snippet.function do |ch, success|
            abort "Error" unless success
            channel.on_data do |ch, data|
              puts "#{data}"
            end
          end
        end
        ssh.loop
      end
    end
  end

end
