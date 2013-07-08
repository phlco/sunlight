require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'rake'
require 'pry'
require 'sunlight'

Sunlight::Base.api_key = '035fbbb591aa4fdba299e64c0d9e867c'

set :database, {
  adapter: 'postgresql',
  database: 'legislators_app',
  host: 'localhost'
}

class Legislator < ActiveRecord::Base

end

get '/' do
  @favorite_legislators = Legislators.all
  erb :index
end

get '/legislators' do
  zipcode = params[:zipcode]
  @legislators = Sunlight::Legislator.all_in_zipcode(zipcode)
  erb :legislators
end


