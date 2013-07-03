require 'rubygems'
require 'sunlight'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'rake'
require 'sinatra/activerecord'
require 'pg'

Sunlight::Base.api_key = '035fbbb591aa4fdba299e64c0d9e867c'

get'/' do

 :index
end

get '/legislator' do

end