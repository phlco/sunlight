require 'json'
require 'ym4r'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pry'
require 'rubygems'
require 'rake'
require 'sunlight'

Sunlight::Base.api_key ='035fbbb591aa4fdba299e64c0d9e867c'

set :database, {adapter: "postgresql",
                database: "politicians",
                host: "localhost"}

class Politician < ActiveRecord::Base
end


get '/' do
  @favorites = Politician.order([:state, :lastname, :firstname])
  erb :index
end


get '/politicians' do
  @politicians= Sunlight::Legislator.all_in_zipcode(params[:zip])

  erb :politicians
end

post '/favorite_politicians' do
  favorite = params[:favorite_politician]
  details = Sunlight::Legislator.all_where(:bioguide_id => favorite).first
  Politician.create(:firstname => details.firstname, :lastname => details.lastname, :state => details.state, :phone => details.phone, :party => details.party, :twitter_id => details.twitter_id, :votesmart_id => details.votesmart_id)
  redirect to '/'
end




#  "#{@politicians.first.firstname} #{@politicians.first.lastname}"
