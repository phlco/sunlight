require 'json'
require 'ym4r'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pry'
require 'rubygems'
require 'rake'
require 'sunlight'
Sunlight::Base.api_key ='035fbbb591aa4fdba299e64c0d9e867c'

set :database, {adapter: "postgresql",
                database: "politicians",
                host: "localhost"}

class Politician < ActiveRecord::Base
end
get '/' do
  zip = params[:zipcode] || 10001
  @politicians= Sunlight::Legislator.all_in_zipcode zip
  erb :index
end