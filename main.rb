require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'sinatra/activerecord'
require 'rubygems'
require 'sunlight'
require 'json'
require 'ym4r'

set :database, {
  adapter: 'postgresql',
  database: 'sunlight',
  host: 'localhost'
}

class Favorites < ActiveRecord::Base
end

Sunlight::Base.api_key = 'e9f3c1270bd24c6980e3408a7179ba12'

# binding.pry

get '/' do
  @favorites = Favorites.all

  # access database to display favorites
  # add party colors
  erb :index
end

get '/results' do
  @zip = params[:zip]
  @legislators = Sunlight::Legislator.all_in_zipcode(@zip)
  erb :results
end

post '/fav' do
  favorite = Favorites.find(params[:id])
  @bioguide_id = params[:bioguide_id]
  favorite = Sunlight::Legislator.all_where(:bioguide_id => "@bioguide_id")
  favorite[10] = params[:firstname]
  favorite[14] = params[:lastname]
  favorite[18] = params[:party]
  favorite[19] = params[:phone]
  favorite[21] = params[:state]
  favorite[22] = params[:twitter_id]
  favorite[13] = params[:in_office]
  favorite[24] = params[:votesmart_id]
  # get unique id from results.erb
  # new api call using unique id
  # send info to database
  # "#{params}"
  redirect to "/"
end





