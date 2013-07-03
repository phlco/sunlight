require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'
require 'sinatra/activerecord'
require 'sunlight'
require 'dotenv'


configure do
  Dotenv.load
  Sunlight::Base.api_key = 'SUNLIGHT_API_KEY'
end

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
  erb :new
end

post '/' do
  zip_code = params[:zip_code]
  @congresspeople = Sunlight::Legislator.all_in_zipcode(zip_code)
end
