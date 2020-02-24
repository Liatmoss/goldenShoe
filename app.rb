require 'sinatra/base'
require_relative './lib/user'

class GoldenShoe < Sinatra::Base

enable :sessions

  get '/' do
    erb :index
  end

  get '/login' do
    erb :login
  end

  get '/signup' do
    erb :signup
  end


  run! if app_file == $0
end
