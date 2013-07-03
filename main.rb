# Sunlight::Base.api_key = '035fbbb591aa4fdba299e64c0d9e867c'

require 'rubygems'
require 'sunlight'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sinatra/activerecord'
require 'pg'

set :database, {adapter: "postgresql",
                database: "sunlight_sinatra",
                host: "localhost"}




get'/' do
  members_of_congress = Sunlight::Legislator.all_in_zipcode('02879')
 :index
end

get '/legislator' do

end