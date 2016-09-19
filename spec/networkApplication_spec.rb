require 'networkApplication'

name = "networkApplicationTest"
username = 'mike'
function = "sudo apt-get update"
hostnames = "192.168.0.25", "192.168.0.7"

describe "NetworkApplication" do

  describe 'create_snippet' do
    it "creates snippet from networkApplication" do
      n = NetworkApplication.new
      n.create_snippet(name, username, function, hostnames)
      expect(n.snippet.name).to eq(name)
      expect(n.snippet.username).to eq(username)
      expect(n.snippet.function).to eq(function)
      expect(n.snippet.hostnames).to eq(hostnames)
    end
  end

  describe 'find_snippet' do
    it "finds and checks for correct snippet" do
      n = NetworkApplication.new
      n.find_snippet(name)
      expect(n.snippet.name).to eq(name)
      expect(n.snippet.username).to eq(username)
      expect(n.snippet.function).to eq(function)
      expect(n.snippet.hostnames).to eq(hostnames)
    end
  end

end
