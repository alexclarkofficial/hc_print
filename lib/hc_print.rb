require 'csv'
require 'erb'
$LOAD_PATH << './lib/helpers'
require 'blank?.rb'
require 'smarter_csv'


class MyApp < Sinatra::Base

  get '/' do
    erb :upload
  end

  post '/' do

    @n = 1

    @orders = SmarterCSV.process(params['myfile'][:tempfile])

    erb :print

  end
	
  not_found do
    "can't find it sorry"
  end
end