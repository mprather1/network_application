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
  
  def create_snippet(name, username, function, *hostnames)
    @r.set(name, [name, username, function, hostnames].to_json)
    load_snippet(name)
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