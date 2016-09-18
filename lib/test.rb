require 'redis'
require 'json'

class Snippet
  
  attr_accessor :name, :username, :function, :hostnames
  
  def initialize
    @name = name
    @username = username
    @function = function
    @hostnames = []
    @r = Redis.new
  end
  
  def show
    puts @name
    puts @username
    puts @function
    puts @hostnames
  end
  
  def save_snippet(name, username, function, hostnames)
    @r.set(name, [name, username, function, hostnames].to_json)
    # load_snippet('testName')
  end
  
  def show_snippet(name)
    snippet = JSON.parse(@r.get(name))
    puts snippet
  end
   
  def load_snippet(name)
    snippet = JSON.parse(@r.get(name))
    @name = "#{snippet[0]}"
    @username = "#{snippet[1]}"
    @function = "#{snippet[2]}"
    @hostnames = "#{snippet[3]}".tr('[]" ', '').split(",")
  end
end

j = Snippet.new
j.name = "testSnippet"
j.username = "mike"
j.function = "sudo apt-get update"
j.hostnames << "host"
j.hostnames << 'host2'
j.save_snippet(j.name, j.username, j.function, j.hostnames)
j.load_snippet(j.name)
puts j.name
# hosts = j.hostnames.tr('[]" ', '').split(",")
# hosts.each do |f|
#   puts f
# end

puts j.hostnames