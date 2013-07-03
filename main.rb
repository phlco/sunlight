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
  erb :index
end

get '/results' do
  @zip = params[:zip]
  @legislators = Sunlight::Legislator.all_in_zipcode(@zip)
  erb :results
end

post '/fav' do
  # get unique id from results.erb
  # new api call using unique id
  # send info to database
  # redirect to index
  "#{params}"
end

