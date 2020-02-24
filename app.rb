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

  post '/signup' do
    @user = User.add(fullname: params['fullname'], email: params['email'], password: params['password'])
    session[:email] = @user.email
    session[:user_id] = @user.id
    session[:signed_in?] = true
    redirect '/'
  end

  get '/signout' do
    session.clear
    redirect '/'
  end

  run! if app_file == $0
end
