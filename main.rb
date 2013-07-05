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
  @bioguide_id = params[:bioguide_id]
  @favorites = Sunlight::Legislator.all_where(:bioguide_id => @bioguide_id).first

  favorite = Favorites.create(params)

  favorite.firstname = @favorites.firstname
  favorite.lastname = @favorites.lastname
  favorite.party = @favorites.party
  favorite.phone = @favorites.phone
  favorite.state = @favorites.state
  favorite.twitter_id = @favorites.twitter_id
  favorite.in_office = @favorites.in_office
  favorite.votesmart_id = @favorites.votesmart_id
  favorite.save

  # @firstname = params[:firstname]
  # @lastname = params[:lastname]
  # @party = params[:party]
  # @phone = params[:phone]
  # @state = params[:state]
  # @twitter_id = params[:twitter_id]
  # @in_office = params[:in_office]
  # @votesmart_id = params[:votesmart_id]

  # get unique id from results.erb
  # new api call using unique id
  # send info to database
  # "#{params}"
  redirect to "/"
end





