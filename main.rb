require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'rake'
require 'sunlight'

Sunlight::Base.api_key = 'e0daa76ad49442f1b4c075067115f5b3'

set :database, {
	adapter: 'postgresql',
	database: 'sulight',
	host: 'localhost'
}

class Legislator < ActiveRecord::Base
end

get '/' do 

end

get '/index' do
	@favorites = Legislator.all
	erb :index
end

get '/legislators' do
	@legislators = Sunlight::Legislator.all_in_zipcode(params[:zip])
	erb :legislators
end

post '/favorite/:votesmart_id' do 
	l = Sunlight::Legislator.all_where(:votesmart_id => "#{params[:votesmart_id]}").first
	binding.pry
	Legislator.create(firstname: l.firstname, lastname: l.lastname, party: l.party,
		state: l.state, twitter_id: l.twitter_id, in_office: l.in_office, 
		votesmart_id: l.votesmart_id)

end
