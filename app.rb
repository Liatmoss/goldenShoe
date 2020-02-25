require 'sinatra/base'
require_relative './lib/user'


class GoldenShoe < Sinatra::Base

enable :sessions

  get '/' do
    erb :index
  end

  get '/login' do
    @password_invalid = false
    erb :login
  end

  post '/login' do
    @user = User.authenticate(email: params['email'], password: params['password'])
    if @user
      session[:signed_in?] = true
      redirect '/'
    else
        @password_invalid = true
        erb :'login'
    end
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

  get '/womens/heels/1' do
    "Hello World"
  end

  run! if app_file == $0
end
