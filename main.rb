require 'rubygems'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sunlight'
require 'pry' if development?
require 'sinatra/activerecord'

Sunlight::Base.api_key = 'ce2abb367a8a4e56b5a2045cada871c3'

set :database, {
  adapter: 'postgresql',
  database: 'sunlight_gov',
  host: 'localhost'
}

class Politician < ActiveRecord::Base

end


def legislator_in_zipcode(zip)
   return Sunlight::Legislator.all_in_zipcode(zip)
end

def legislator_votesmart_id(votesmart)
   return Sunlight::Legislator.votesmart_id(votesmart)
end



# == Schema Info
# Table name: politicians
#
# firstname       :string
# firstname       :string
# lastname        :string
# party           :string
# phone           :string
# state           :string
# twitter_id      :string
# in_office       :boolean
# votesmart_id    :string
# bioguide_id     :string


get '/' do
  erb :index
end

get '/search/zipcode' do
    zipcode = params[:zipcode]
   @legislators = legislator_in_zipcode(zipcode)
   erb :search_results
end


post 'favs/new' do
# Seach the Sunlight API to find a particular politician and save that politician to the DB
votesmart_id = params[:votesmart_id].to_i
legislator =  Sunlight::legislator.all_where(:votesmart_id => votesmart_id).first

redirect to '/'
end


