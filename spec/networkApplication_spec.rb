require 'networkApplication'
require 'snippet'

name = "undtgradt"
username = 'mike'
function = "sudo apt-get update"
hostnames = "192.168.0.25", "192.168.0.7"

describe 'Snippet' do
  
  describe 'attributes' do
    it 'allows for reading and writing for :name' do
      snippet = Snippet.new
      snippet.name = "snippetName"
      expect(snippet.name).to eq('snippetName')
    end
    
    it 'allows for reading and writing for :hostnames' do
      snippet = Snippet.new
      snippet.hostnames = 'snippetHostname1', 'snippetHostname2'
      expect(snippet.hostnames).to eq(['snippetHostname1', 'snippetHostname2'])
    end
    
  end
  
  describe 'functions' do
    
    it "allows for saving and loading of snippets" do
      snippet = Snippet.new
      snippet.save_snippet(name, username, function, hostnames)
      # snippet.load_snippet(name)
      expect(snippet.name).to eq(name)
      expect(snippet.username).to eq(username)
      expect(snippet.function).to eq(function)
      expect(snippet.hostnames).to eq(hostnames)

    end
  end
end  

describe "networkApplication" do
  
  describe 'find_snippet' do
    it "finds and checks for correct snippet" do
      skip
      n = NetworkApplication.new
      n.find_snippet(name)
      expect(n.snippet.name).to eq(name)
      expect(n.snippet.username).to eq(username)
      expect(n.snippet.function).to eq(function)
      expect(n.snippet.hostnames).to eq(hostnames)
    end
  end
  
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
end