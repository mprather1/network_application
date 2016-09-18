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
      `ssh #{@user}@#{host} #{func}`
    end
  end
end

n = NetworkApplication.new
n.user = "mike"
n.add_hostname "192.168.0.25", "192.168.0.3"
n.run_function "sudo apt-get upgrade"
