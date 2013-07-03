require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'pg'
require 'rubygems'
require 'pry'
require 'ym4r'
require 'json'
require 'sunlight'
Sunlight::Base.api_key = '65bbec37a7174e2d8a6edab362cdf3e8'

set :database, {
  adapter: 'postgresql',
  database: 'sunlight',
  host: 'localhost'
}

get '/' do
  erb :index
end

post '/' do
  @zipcode = params[:zipcode]
  redirect to("/#{@zipcode}")
end

get '/:zipcode' do
  code = params[:zipcode]
  @results = Sunlight::Legislator.all_in_zipcode(code)

  erb :results
end