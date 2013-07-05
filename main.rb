require 'pg'
require 'pry'
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sunlight'

Sunlight::Base.api_key = '035fbbb591aa4fdba299e64c0d9e867c'

set :database, {
              :adapter => 'postgresql',
              :database => 'legislator',
              :host => 'localhost'
}

class Politicians < ActiveRecord::Base
end

get '/' do
  @politicians = Politicians.all
  erb :index
end
#Have to transfer the zipcode onto the new page to display politicians
#of that certain area
post '/' do
  redirect to("/#{params[:zipcode]}")
end
#NOT '/politicians' - cannot pass zipcode that way.
# assigned the url to the zipcode parameters.
get '/:zipcode' do
  @zipcode = params[:zipcode]
  #Defining instance variable with Sunlight app
  @politicians = Sunlight::Legislator.all_in_zipcode(@zipcode)
  erb :politicians_in_zipcode
end

#using id passed from like button on zipcode page
post '/like' do
  liked = Sunlight::Legislator.all_where(:votesmart_id => params[:votesmart_id]).first

  Politicians.create(:firstname => liked.firstname,
                    :lastname => liked.lastname,
                    :party => liked.party,
                    :state => liked.state,
                    :twitter_id => liked.twitter_id,
                    :in_office => liked.in_office,
                    :votesmart_id => liked.votesmart_id
                    )
  redirect to('/')
end
