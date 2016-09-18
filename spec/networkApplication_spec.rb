require 'networkApplication'

describe "networkApplication" do
  
  describe 'find_snippet' do
    it "finds and checks for correct snippet" do
      n = NetworkApplication.new
      name = "testSnippet"
      username = 'snippetUsername'
      function = "snippetFunction"
      hostnames = "snippetHostname1", "snippetHostname2"
      n.find_snippet('testSnippet')
      expect(n.snippet.name).to eq(name)
      expect(n.snippet.username).to eq(username)
      expect(n.snippet.function).to eq(function)
      expect(n.snippet.hostnames).to eq(hostnames)
    end
  end
  
end