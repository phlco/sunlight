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
 zipcode = params[:zipcode]
  @legislators = Sunlight::Legislator.all_in_zipcode(zipcode)
  erb :legislator
end

post '/' do
  votesmart_id = params[:votesmart_id].to_i
  legislator = Sunlight::Legislator.all_where(:votesmart_id => votesmart_id).first
  a_legislator = Legislator.create(firstname: legislator.firstname,
                                      lastname: legislator.lastname,
                                      phone: legislator.phone,
                                      state: legislator.state,
                                      twitter_id: legislator.twitter_id,
                                      in_office: legislator.in_office,
                                      votesmart_id: legislator.votesmart_id)
  redirect to '/'
end

