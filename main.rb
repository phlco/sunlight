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
