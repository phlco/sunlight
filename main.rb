require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'rake'
require 'sunlight'

Sunlight::Base.api_key = 'e0daa76ad49442f1b4c075067115f5b3'

set :database, {
	adapter: 'postgresql',
	database: 'sulight',
	host: 'localhost'
}
