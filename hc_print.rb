require 'sinatra'
require 'erb'

get '/' do
  erb :upload
end

post '/upload' do
  tempfile = params[:file][:tempfile]
  filename = params[:file][:filename]

end

get '/print' do

end

not_found do
  "can't find it sorry"
end