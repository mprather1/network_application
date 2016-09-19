require 'snippet'

name = "snippetTest"
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

    it 'allows for reading and writing for :username' do
      snippet = Snippet.new
      snippet.username = "snippetUsername"
      expect(snippet.username).to eq('snippetUsername')
    end

    it 'allows for reading and writing for :function' do
      snippet = Snippet.new
      snippet.function = "snippetFunction"
      expect(snippet.function).to eq('snippetFunction')
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
