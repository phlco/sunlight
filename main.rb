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


Sunlight::Base.api_key = 'e9f3c1270bd24c6980e3408a7179ba12'

# binding.pry

get '/' do

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
  @bioguide_id = params[:bioguide_id]
  @favorite = Sunlight::Legislator.all_where(:bioguide_id => "@bioguide_id")
  firstname - @favorite.firstname
  # get unique id from results.erb
  # new api call using unique id
  # send info to database
  "#{params}"
  # redirect to "/"
end





