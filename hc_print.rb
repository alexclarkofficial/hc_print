require 'rubygems'
require 'sinatra'
require 'erb'

get '/' do
  erb :upload
end

post "/" do 
  File.open('/' + params['myfile'][:filename], "w") do |f|
    f.write(params['myfile'][:tempfile].read)
  end
  return "The file was successfully uploaded!"
end

get '/print' do
  return @arr_of_arrs
end
	
not_found do
  "can't find it sorry"
end