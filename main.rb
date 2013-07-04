require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry' if development?
require 'sinatra/activerecord'
require 'rubygems'
require 'sunlight'

Sunlight::Base.api_key = '035fbbb591aa4fdba299e64c0d9e867c'

# set :database, {
#   adapter: 'postgresql',
#   database: 'sunlight',
#   host: 'localhost'
# }

# This should show index
# Search box and list FAVORITE LEGISLATORS
get '/' do
 erb :index
end

# This should send a post request to the url
post '/' do
  zipcode = params[:zipcode]
  redirect to "/legislators/#{zipcode}"
end
binding.pry

# This should display all results of the zipcode search
# @legislators will point to an array of objects
get '/legislators/:zipcode' do
  @zipcode = params[:zipcode]
  @legislators = Sunlight::Legislator.all_in_zipcode(@zipcode)
  erb :legislators
end
