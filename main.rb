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


#def legislator_in_zipcode(zip)
 #  return Sunlight::Legislator.all_in_zipcode(zip)
#end


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

end


get '/index' do
  @favorites = Politician.all
  erb :index
  end

get '/search/zipcode' do
  @politicians = Sunlight::Legislator.all_in_zipcode(params[:zip])
  erb :search_results
  end


post '/favorites' do
  favortite = Sunlight::Legislator.all_where(:votesmart_id => params[:votesmart_id].to_i).first


Politician.create(firstname: favorite.firstname, lastname: favorite.lastname, party: favorite.party, phone: favorite.phone, state: favorite.state, twitter_id: favorite.twitter_id, in_office: favorite.in_office, votesmart_id: favorite.votesmart_id)
end





