

class WineController < ApplicationController

  get '/wines' do
    if is_logged_in?
      erb :'wines/wines'
    else
      redirect '/login'
    end
  end

  get '/wines/new' do
    if  is_logged_in?
      erb :'wines/create_wine'
    else
      redirect '/login'
    end
  end

  get '/wines/:id' do
    if  !is_logged_in?
      redirect '/login'
    else
      @user = current_user
      @wine = Wine.find_by_id(params[:id])
      erb :'/wines/show_wine'
    end
  end

  post '/wines' do
    is_logged_in?
    if params[:name].empty?
      redirect '/wines/new'
    else @wine = Wine.create(params)
    end
    current_user.wines << @wine
    flash[:message] = "Successfully added wine."

    redirect "/users/#{current_user.id}"
  end

  get '/wines/:id/edit' do
    if  !is_logged_in?
      redirect '/login'
    else
      @wine = Wine.find_by_id(params[:id])
      erb :'/wines/edit_wine'
    end
  end

  patch '/wines/:id' do
  if
    !is_logged_in?
      redirect '/login'

  else
    @wine = Wine.find(params[:id])
      if @wine.name.empty?
      redirect "/wines/#{@tweet.id}/edit"
    end
    @wine.update(name: params[:name])if @wine.user == current_user
    @wine.save
    redirect "/wines/#{@wine.id}"

  end
  end

  delete '/wines/:id/delete' do
  if
      !is_logged_in?
      redirect '/login'
  else
    @wine = Wine.find_by_id(params[:id])
    @wine.destroy if @wine.user == current_user
    redirect '/wines'
  end
  end

end
