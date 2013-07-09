require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'rake'
require 'pry'
require 'sunlight'
require 'dotenv'
require 'pg'

set :database, {
  adapter: 'postgresql',
  database: 'sunlight_api',
  host: 'localhost'
}

Dotenv.load
Sunlight::Base.api_key = 'd1ec724a9b6c4328bc9ba78ac386cc6d'

class Legislator < ActiveRecord::Base
end

get '/' do
  @legislators = Legislator.all

  erb :index
end

post '/legislator_search' do
  @result_legislators = Sunlight::Legislator.all_in_zipcode("#{params[:zip]}")
  erb :legislator_search
end

post '/fav_legislator/:id' do
  legislator = Sunlight::Legislator.all_where(:votesmart_id => params[:id]).first
  Legislator.create(firstname: legislator.firstname, lastname: legislator.lastname, in_office: legislator.in_office, party: legislator.party, state: legislator.state, phone: legislator.phone, twitter_id: legislator.twitter_id)

  redirect to('/')
end

get '/fav_legislators' do
  @legislators = Legislator.all

  erb :fav_legislators
end
