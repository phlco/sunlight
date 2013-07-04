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
  redirect to('/')
end
