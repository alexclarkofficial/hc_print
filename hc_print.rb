require 'sinatra'
require 'erb'
require 'csv'

get '/' do
  erb :upload
end

post '/print' do
  @arr_of_arrs = CSV.read("files/sample.csv").join(", ")
  return @arr_of_arrs
end

get '/print' do
  return @arr_of_arrs
end
	
not_found do
  "can't find it sorry"
end