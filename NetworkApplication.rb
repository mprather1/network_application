require 'net/ssh'

class NetworkApplication

  attr_accessor :user

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

  def run_function(func)
    @hostnames.each do |host|
      Net::SSH.start(host, @user) do |ssh|
        hostname = ssh.exec! 'hostname'
        puts "Executing #{func} on #{hostname}..."
        ssh.open_channel do |channel|
          channel.exec "#{func}" do |ch, success|
            abort "could not execute command" unless success
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
