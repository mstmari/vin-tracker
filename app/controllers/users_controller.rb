
class UserController < ApplicationController
  enable :sessions
  use Rack::Flash


  get '/signup' do
  if session[:user_id]
    flash[:message] = "You're already logged in!"

     redirect '/wines'
   end
    erb :'users/create_user'
  end

  get '/login' do
    if session[:user_id]
      flash[:message] = "You're already logged in!"

       redirect '/wines'
     end
    erb :'users/login'
  end



  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user. authenticate(params[:password])
    session[:user_id]= @user.id
    flash[:message] = "Welcome #{@user.username}."

    redirect "/users/#{@user.id}"

 else
    flash[:message] = "Incorrect Login Information"
    redirect '/login'
  end
  end

  get '/users/:id' do
    @current_user = User.find_by_id(params[:id])
    erb :'/users/show'
  end


  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
    flash[:message] = "You Must Complete All Fields"
    redirect "/signup"
  elsif !params[:email].match /@/
  flash[:message] = "Invalid Email"

  redirect "/signup"

   else @current_user = User.create(params)
        session[:user_id]= @current_user.id
        redirect "/users/#{@current_user.id}"
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



end
