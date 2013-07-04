require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'pg'
require 'rubygems'
require 'pry'
require 'ym4r'
require 'json'
require 'sunlight'
Sunlight::Base.api_key = '65bbec37a7174e2d8a6edab362cdf3e8'

set :database, {
  adapter: 'postgresql',
  database: 'sunlight',
  host: 'localhost'
}

class Legislator < ActiveRecord::Base
end

get '/' do
  erb :index
end

post '/' do
  @zipcode = params[:zipcode]
  redirect to("/#{@zipcode}")
end

get '/fav' do
  @fav = Legislator.all
  erb :fav
end

get '/:zipcode' do
  code = params[:zipcode]
  @results = Sunlight::Legislator.all_in_zipcode(code)
  erb :results
end

post '/legislator/:phone' do
  phone = params[:phone]
  fav_legislator = Sunlight::Legislator.all_where(:phone => phone).first
  firstname = fav_legislator.firstname
  lastname = fav_legislator.lastname
  party = fav_legislator.party
  votesmart_id = fav_legislator.votesmart_id
  state = fav_legislator.state
  twitter_id = fav_legislator.twitter_id
  in_office = fav_legislator.in_office

  leg = Legislator.create(firstname: firstname, lastname: lastname, party: party, phone: phone, state: state, twitter_id: twitter_id, in_office: in_office, votesmart_id: votesmart_id)
  redirect to("/fav")
end
