require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'rake'
require 'sunlight'
require 'rubygems'
require 'pg'
require 'pry'

Sunlight::Base.api_key = 'b50873c5ee334c638eb0822f5a57c3a5'


# Configure the database
set :database, {
  adapter: 'postgresql',
  database: 'congress',
  host: 'localhost'
}


# Configure ActiveRecord to interact with a politicians table
class Politician < ActiveRecord::Base
end

get '/' do
  # display an input to search by zipcode
  # list all politicians saved to the database
  @faves = Politician.all
  erb :index
end

get '/search' do
  # Search the Sunlight API by zipcode
  # Display all available politicians
  @zipcode = params[:zipcode]
  @congresspeople = Sunlight::Legislator.all_in_zipcode(@zipcode)
  erb :search
end

post '/favs/new' do
  # Search the Sunlight API for a particular politician
  # save that politician to the database
  votesmart_id = params[:id]
  congressperson = Sunlight::Legislator.all_where(:votesmart_id => votesmart_id)
  fave = Politician.create(params)
  fave.firstname = congressperson.firstname
  fave.lastname = congressperson.lastname
  fave.party = congressperson.party
  fave.phone = congressperson.phone
  fave.state = congressperson.state
  fave.twitter_id = congressperson.twitter_id
  fave.in_office = congressperson.in_office

  redirect to '/'
end
