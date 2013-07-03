require 'pg'
require 'pry'
require 'sinatra'
require 'rubygems'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'sunlight'
Sunlight::Base.api_key = '035fbbb591aa4fdba299e64c0d9e867c'

set :database, {
              :adapter => 'postgresql',
              :database => 'legislator',
              :host => 'localhost'
}

