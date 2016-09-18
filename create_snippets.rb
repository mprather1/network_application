require_relative 'lib/networkApplication'

n = NetworkApplication.new
n.create_snippet("undtgradt", "mike", "sudo apt-get update && sudo apt-get upgrade -y", "192.168.0.25", "192.168.0.7", "192.168.0.31")
