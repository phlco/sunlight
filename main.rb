########################################
# Set up
########################################
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'pg'
require 'rubygems'
require 'sunlight'
Sunlight::Base.api_key = '035fbbb591aa4fdba299e64c0d9e867c'

########################################
# Method Definition
########################################

def sunlight_by_zip(zipcode)
  result = Sunlight::Legislator.all_in_zipcode(zipcode)
  return result
end


########################################
#
########################################

get '/' do
  erb :index
end

get '/result' do
  @search_result = sunlight_by_zip(params[:zip_input])
  erb :searchresult
end

post '/savefav' do
  redirect to("/")
end




# @bioguide_id="N000002",
# @birthdate="10947-06-13 00:00:00 -0400",
# @congress_office="2110 Rayburn House Office Building",
# @congresspedia_url="http://www.opencongress.org/wiki/Jerrold_Nadler",
# @crp_id="N00000939",
# @district="10",
# @email="",
# @facebook_id="CongressmanNadler",
# @fax="202-225-6923",
# @fec_id="H2NY17071",
# @firstname="Jerrold",
# @gender="M",
# @govtrack_id="400289",
# @in_office=true,
# @lastname="Nadler",
# @middlename="L.",
# @name_suffix="",
# @nickname="",
# @party="D",
# @phone="202-225-5635",
# @senate_class="",
# @state="NY",
# @title="Rep",
# @twitter_id="RepJerryNadler",
# @votesmart_id="26980",
# @webform="http://www.house.gov/nadler/emailform.shtml",
# @website="http://www.house.gov/nadler",
# @youtube_url="http://youtube.com/congressmannadler"