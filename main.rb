require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'sinatra/activerecord'
require 'rubygems'
require 'sunlight'
require 'json'
require 'ym4r'

set :database, {
  adapter: 'postgresql',
  database: 'sunlight',
  host: 'localhost'
}


Sunlight::Base.api_key = 'e9f3c1270bd24c6980e3408a7179ba12'


get '/'  do
  erb :index
end

