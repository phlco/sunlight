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
  erb :index
end

get '/legislators' do
  zipcode = params[:zipcode]
  @legislators = Sunlight::Legislator.all_in_zipcode(zipcode)
  erb :legislators
end







