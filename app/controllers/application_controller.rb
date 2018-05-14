require './config/environment'
require 'sinatra/base'
require 'rack-flash'


class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "secret"
    enable :sessions
    use Rack::Flash


  end

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do

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
