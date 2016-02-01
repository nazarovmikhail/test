require 'sinatra'
#set :server, 'webrick'
require 'twitter'

OpenSSL::SSL::VERIFY_PEER=OpenSSL::SSL::VERIFY_NONE

get '/' do
  # use the views/index.erb file
  erb :index
end
#haha
get '/agent' do
  # use the views/agent.erb file
  erb :agent
end

class TwitterClass
	def initialize
		@client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "L4iUx497S1yRVwCp1YxJ0Opkx"
		  config.consumer_secret     = "UnKC055XgKUyHgDKNVtuTF7IZPXu6L96xRFdC9XJ1o6Mad4t8n"
		  config.access_token        = "4213475849-IPpbkqmqCpjHKZE7O73gDzpEWcNqKX6EC0jhK21"
		  config.access_token_secret = "BXtb0IgaAbWrrrkBPh6yp4lMlWNtbsQNOAzafbW7qA0y8"
		end
	end
	def searchUser(person)
		call=@client
			.search("#{person}", result_type: "recent")
			.take(100)
			.group_by{|t| t.user.screen_name}
			.sort_by{|g| g.last.count}.reverse
		call.first.first
	end
end

get '/:user_name' do
	myTwitter=TwitterClass.new
	@a = myTwitter.searchUser(params[:user_name])
	erb :user
end
get '/posts' do
	myTwitter=TwitterClass.new
	@a = myTwitter.searchUser(params['user'])
	erb :user
end