require 'sinatra'

class GoldenShoe < Sinatra::Base

enable :sessions

  get '/' do
  'Hello'
    # erb :index
  end


  run! if app_file == $0
end
