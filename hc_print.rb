require 'sinatra'
require 'erb'
require 'csv'

get '/' do
  erb :upload
end

post "/" do 
  File.open('files/' + params['myfile'][:filename], "w") do |f|
    f.write(params['myfile'][:tempfile].read)
  end
end

get '/print' do
  @orders = {}

  CSV.foreach("files/hc_sample.csv", :headers => true, :header_converters => :symbol, :converters => :all) do |row|
  	@orders[row.fields[0]] = Hash[row.headers[1..-1].zip(row.fields[1..-1])]
  end

  erb :print

end
	
not_found do
  "can't find it sorry"
end