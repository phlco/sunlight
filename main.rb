require 'pg'
require 'pry'
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sunlight'
Sunlight::Base.api_key = '035fbbb591aa4fdba299e64c0d9e867c'

set :database, {
              :adapter => 'postgresql',
              :database => 'legislator',
              :host => 'localhost'
}

class Politician < ActiveRecord::Base

end

get '/' do
  erb :index
end

get '/politicians' do
  zipcode = params[:zipcode]
  #Defining instance variable with Sunlight app
  @politicians = Sunlight::Legislator.all_in_zipcode(zipcode)
  erb :politicians
end
binding.pry
