require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry' if development?
require 'sinatra/activerecord'
require 'rubygems'
require 'sunlight'

Sunlight::Base.api_key = '035fbbb591aa4fdba299e64c0d9e867c'

set :database, {
  adapter: 'postgresql',
  database: 'legislators',
  host: 'localhost'
}

class Favorite < ActiveRecord::Base
end

# This should show index
# Search box and list FAVORITE LEGISLATORS
get '/' do
  @favorites = Favorite.all
 erb :index
end

# This should send a post request to the url
post '/' do
  zipcode = params[:zipcode]
  redirect to "/legislators/#{zipcode}"
end
# binding.pry

# This should display all results of the zipcode search
# @legislators will point to an array of objects
get '/legislators/:zipcode' do
  @zipcode = params[:zipcode]
  @legislators = Sunlight::Legislator.all_in_zipcode(@zipcode)
  erb :legislators
end

# This should display an individual legislator and details
get '/legislator/:bioguide_id' do
  bioguide_id = params[:bioguide_id]
  @legislator = Sunlight::Legislator.all_where(:bioguide_id => bioguide_id).first
  erb :legislator
end

# This should send a post request to the url
# Create a new favorite in the favorites table in the legislators database
post '/legislator/:bioguide_id' do
  bioguide_id = params[:bioguide_id]
  legislator = Sunlight::Legislator.all_where(:bioguide_id => bioguide_id).first
  favorite = Favorite.create(bioguide_id: legislator.bioguide_id, title: legislator.title, firstname: legislator.firstname, lastname: legislator.lastname, party: legislator.party, phone: legislator.phone, state: legislator.state, twitter_id: legislator.twitter_id, in_office: legislator.in_office, votesmart_id: legislator.votesmart_id)
  redirect to "/"
end

