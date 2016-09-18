require 'snippet'

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
      name = "testSnippet"
      username = 'snippetUsername'
      function = "snippetFunction"
      hostnames = "snippetHostname1", "snippetHostname2"
      
      snippet.save_snippet(name, username, function, hostnames)
      # snippet.load_snippet(name)
      expect(snippet.name).to eq(name)
      expect(snippet.username).to eq(username)
      expect(snippet.function).to eq(function)
      expect(snippet.hostnames).to eq(hostnames)

    end
  end
  
end