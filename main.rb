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

helpers do
	def in_database?(phone)
		unless Legislator.find_all_by_phone(phone).first
			false
		else
			true
		end
	end
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

post '/favorite' do 
	l = Sunlight::Legislator.all_where(:phone => params[:phone]).first 
	unless in_database? params[:phone]
		Legislator.create(firstname: l.firstname, lastname: l.lastname, party: l.party,
		phone: l.phone, state: l.state, twitter_id: l.twitter_id, in_office: l.in_office, 
		votesmart_id: l.votesmart_id)
	end
	redirect to('/index')
end
