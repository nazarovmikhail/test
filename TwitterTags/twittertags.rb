require 'twitter'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "L4iUx497S1yRVwCp1YxJ0Opkx"
  config.consumer_secret     = "UnKC055XgKUyHgDKNVtuTF7IZPXu6L96xRFdC9XJ1o6Mad4t8n"
  config.access_token        = "4213475849-IPpbkqmqCpjHKZE7O73gDzpEWcNqKX6EC0jhK21"
  config.access_token_secret = "BXtb0IgaAbWrrrkBPh6yp4lMlWNtbsQNOAzafbW7qA0y8"
end


client.search("#{ARGV[0]} -rt").take(20).collect do |tweet|
	#client.
	puts tweet.text
end

#initialize(request)