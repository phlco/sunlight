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

post '/' do
  zip = params[:zip]
  legislator = Sunlight::Legislator.all_in_zipcode(zip)
  redirect to('/search_results')
end

