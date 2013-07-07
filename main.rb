########################################
# LOAD REQUIRED GEMS AND FILES
########################################
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'pg'
require 'rubygems'
require 'sunlight'
Sunlight::Base.api_key = '035fbbb591aa4fdba299e64c0d9e867c'

########################################
# METHOD DEFINITION
########################################

def sunlight_by_zip(zipcode)
  result = Sunlight::Legislator.all_in_zipcode(zipcode)
  return result
end


########################################
# CONNECT TO DATABASE VIA ACTIVERECORD
########################################
set :database, {
  adapter: 'postgresql',
  database: 'sunlight_hw',
  host: 'localhost'
}

class FavLegislator < ActiveRecord::Base
end

########################################
# CONNECT TO DATABASE VIA AR
########################################

get '/' do
  @FavLegislators = FavLegislator.all
  erb :index
end

get '/result' do
  @search_result = sunlight_by_zip(params[:zip_input])
  erb :searchresult
end

post '/savefav' do
  favlegislator = Sunlight::Legislator.all_where(:bioguide_id => params[:bioguide_id]).first

  firstname = favlegislator.firstname
  lastname = favlegislator.lastname
  party = favlegislator.party
  phone = favlegislator.phone
  twitter_id = favlegislator.twitter_id
  in_office = favlegislator.in_office
  votesmart_id = favlegislator.votesmart_id

  FavLegislator.create(
    firstname: firstname,
    lastname: lastname,
    party: party,
    phone: phone,
    twitter_id: twitter_id,
    in_office: in_office,
    votesmart_id: votesmart_id
    )

  redirect to("/")
end

