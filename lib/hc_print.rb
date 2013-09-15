require 'CSV'
require 'erb'
class MyApp < Sinatra::Base

get '/' do
  erb :upload
end

post "/" do 

  @orders = {}
  @n = 1

  CSV.foreach(params['myfile'][:tempfile], :headers => true, :header_converters => :symbol, :converters => :all) do |row|
  	@orders[row.fields[0]] = Hash[row.headers[1..-1].zip(row.fields[1..-1])]
  end

  erb :print

end
	
not_found do
  "can't find it sorry"
end
end