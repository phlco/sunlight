require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'
require 'sinatra/activerecord'
require 'sunlight'
require 'rake'

# configure do
#   Dotenv.load
#   Sunlight::Base.api_key = 'SUNLIGHT_API_KEY'
# end

Sunlight::Base.api_key = 'aa57d00513014599b7b6004dec5685c8'

set :database, {
  adapter: 'postgresql',
  database: 'politicians',
  host: 'localhost'
}

class Congressperson < ActiveRecord::Base
end

get '/' do
  erb :index
end

get '/new' do
  zip_code = params[:zip_code]
  @congresspeople = Sunlight::Legislator.all_in_zipcode(zip_code)
  erb :new
end

post '/favorites' do
  congresspeoples = Sunlight::Legislator.all_where(:votesmart_id => params[:votesmart_id]).first
  # binding.pry
  Congressperson.create(firstname: congresspeoples.firstname, lastname: congresspeoples.lastname, state: congresspeoples.state, party: congresspeoples.party, phone: congresspeoples.phone, twitter_id: congresspeoples.twitter_id, in_office: congresspeoples.in_office, votesmart_id: congresspeoples.votesmart_id)
  redirect to('/')
end
