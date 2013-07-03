require 'pg'
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'rubygems'
require 'sunlight'
Sunlight::Base.api_key = '50479a20636a4d47b1fa69560e2b18b9'

class Legislator < ActiveRecord::Base
end

get '/' do
  # list of favored legislators
  erb :index
end

post '/' do
  cp = Sunlight::Legislator.all_in_zipcode(params[:zip])
  redirect to "/#{params[:zip]}"
end

get '/:zip' do
  @congresspeople = Sunlight::Legislator.all_in_zipcode(params[:zip])
  erb :zip
end

# cp = Sunlight::Legislator.all_in_zipcode(19803)
#   binding.pry