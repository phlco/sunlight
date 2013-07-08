require 'pg'
require 'pry'
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sunlight'

#sets up the database
set :database, {
              :adapter => 'postgresql',
              :database => 'sunlight_sinatra',
              :host => 'localhost' }
# uses the api key to access the api
Sunlight::Base.api_key = '035fbbb591aa4fdba299e64c0d9e867c'

class Legislator < ActiveRecord::Base
end


# posts all the favorite legislators and puts the search bar
get '/' do
  @fav_legislators = Legislator.all
  erb :index
end

get '/legislator' do

erb :legislator
end


