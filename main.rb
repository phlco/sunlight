require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'
require 'sinatra/activerecord'
require 'sunlight'

set :database, {
  adapter: 'postgresql',
  database: 'politicians',
  host: 'localhost'
}

get '/' do
  erb :index
end