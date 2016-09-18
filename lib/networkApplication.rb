require 'net/ssh'
require_relative 'snippet'

class NetworkApplication

  attr_accessor :snippet

  def find_snippet(name)
    @snippet = Snippet.new
    @snippet.load_snippet(name)
  end

  def create_snippet(name, username, function, *hostnames)
    @snippet = Snippet.new
    @snippet.save_snippet(name, username, function, hostnames)
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
      ssh.open_channel do |channel|
        puts "\nExecuting #{function} on #{hostname}..."
        channel.exec function do |ch, success|
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
