require 'sinatra/base'

class GoldenShoe < Sinatra::Base

enable :sessions

  get '/' do
    erb :index
  end


  run! if app_file == $0
end
