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

########################################
# CONNECT TO DATABASE VIA AR
########################################

get '/' do
  erb :index
end

get '/result' do
  @search_result = sunlight_by_zip(params[:zip_input])
  erb :searchresult
end

post '/savefav' do

  # t.string :firstname
  # t.string :lastname
  # t.string :party
  # t.string :phone
  # t.string :twitter_id
  # t.boolean :in_office
  # t.string :votesmart_id



  redirect to("/")
end