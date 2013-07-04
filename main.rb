require 'rubygems'
require 'sunlight'
require 'pg'
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'yaml'

Sunlight::Base.api_key = '035fbbb591aa4fdba299e64c0d9e867c'

set :database, {
  adapter: 'postgresql',
  database: 'favorite_legislators',
  host: 'localhost'
}

class Favorite_Legislator < ActiveRecord::Base
end

# Show index page with zip box and legislator list
get '/' do
  @favorites = Favorite_Legislator.all
  erb :index
end

# Show the legislator search results
get '/legislators' do
  @members_of_congress = Sunlight::Legislator.all_in_zipcode(params[:zip])
  erb :legislators
end

# Store the favorited legislator in the database
post '/favorited' do
  fave = YAML.load(params[:favorited])
  Favorite_Legislator.create(:firstname => fave.firstname, :lastname => fave.lastname, :party => fave.party, :phone => fave.phone, :state => fave.state, :twitter_id => fave.twitter_id, :in_office => fave.in_office, :votesmart_id => fave.votesmart_id)
  redirect to '/'
end







