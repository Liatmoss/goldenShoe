require 'sinatra/base'
require_relative './lib/user'
require_relative './lib/shoe'
require_relative './lib/orders'


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
      session[:email] = @user.email
      session[:user_id] = @user.id
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
    session[:signed_in] = false
    redirect '/'
  end

  get '/heel1' do
    @shoes = Shoe.all
    erb :heel1
  end

  post '/heel1' do
    @shoe_size = params[:size_choice]
    @shoe = Shoe.select(shoe_size: @shoe_size)
    @order = Orders.add(shoe_id: @shoe, user_id: session[:user_id].to_i)
    session[:shoe_id] = @shoe
    redirect '/basket'
  end

  get '/basket' do
    @orders = Orders.all
    @shoe = Shoe.all
    @user_order = Orders.user_id(user_id: session[:user_id].to_i)
    @shoe_info = Shoe.shoe_order(id: session[:shoe_id])
    erb :basket
  end

  run! if app_file == $0
end
