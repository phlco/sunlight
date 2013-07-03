require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'rake'
require 'pry'
require 'sunlight'
require 'dotenv'
require 'pg'

set :database, {
  adapter: 'postgresql',
  database: 'sunlight_api',
  host: 'localhost'
}

Dotenv.load
Sunlight::Base.api_key = ENV['SUNLIGHT_API_KEY']

# class Legislator << ActiveRecord::Base
# end

get '/' do
  @legislators = Legislator.all

  erb :index
end