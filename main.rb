require 'rubygems'
require 'sunlight'
require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader' if development?

Sunlight::Base.api_key = '035fbbb591aa4fdba299e64c0d9e867c'

set :database, {
  adapter: 'postgresql',
  database: 'legislators_app',
  host: 'localhost'
}

class Legislator < ActiveRecord::Base

end

get '/' do
  @favorite_legislators = Legislator.all
  erb :index
end

get '/legislators' do
  zipcode = params[:zipcode]
  @legislators = Sunlight::Legislator.all_in_zipcode(zipcode)
  erb :legislators
end

post '/new_favorite_legislator' do
  votesmart_id = params[:votesmart_id].to_i
  legislator = Sunlight::Legislator.all_where(:votesmart_id => votesmart_id).first
  this_legislator = Legislator.create(first: legislator.firstname, last: legislator.lastname, phone: legislator.phone, state: legislator.state, twitter_id: legislator.twitter_id, in_office: legislator.in_office, votesmart_id: legislator.votesmart_id)
  redirect to '/'
end







