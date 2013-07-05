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