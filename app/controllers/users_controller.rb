class UserController < ApplicationController


  get '/signup' do

  # if session[:user_id]
  #    redirect '/wines'
  #  end
    erb :'users/create_user'
  end

  get '/login' do
    # if session[:user_id]
    #    redirect '/wines'
    #  end
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
    session[:user_id]= @user.id
    redirect '/wines'
 else
    redirect '/login'
  end
  end


  post '/signup' do

    if params[:username].empty?
       redirect '/signup'

    elsif params[:email].empty?
        redirect '/signup'

    elsif params[:password].empty?
        redirect '/signup'

    else @current_user = User.create(params)
        session[:user_id]= @current_user.id
        redirect '/wines'
      end
  end

  get '/logout' do
    if is_logged_in?
    session.clear
    redirect '/login'
  else
    redirect '/'
  end
  end


  helpers do
    def current_user
      if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

    def is_logged_in?
      !!current_user
    end
  end

end
