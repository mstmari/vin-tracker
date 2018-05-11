require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"

  end

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    flash[:notice] = "Hooray, Flash is working!"

    erb :index
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
