require_relative 'NetworkApplication'

n = NetworkApplication.new
n.user = "mike"
n.add_hostname "192.168.0.25", "192.168.0.7"
n.run_function "sudo apt-get update"
