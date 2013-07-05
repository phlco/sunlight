require 'rubygems'
require 'sunlight'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
Sunlight::Base.api_key = '035fbbb591aa4fdba299e64c0d9e867c'

set :database, {adapter: "postgresql",
                database: "Homework",
                host: 'localhost',
                username: 'postgres',
                password: 'postgres'}

class Legislator < ActiveRecord::Base
end

get '/' do
  @legislators = Legislator.all
  erb :index
end

get '/display' do
  @legislators = Sunlight::Legislator.all_in_zipcode(params[:zipcode])
  #@legislators = Legislator.all(params[:zipcode])
  redirect to "/#{params[:zipcode]}"
end

get '/:zipcode' do
  @zipcode = params[:zipcode]
  @legislators = Sunlight::Legislator.all_in_zipcode(@zipcode)

  erb :zipcode
end

post '/favorite' do
  Legislator.create(params)
  redirect to '/'
end

