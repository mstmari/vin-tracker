class WineController < ApplicationController

get '/wines' do
  if is_logged_in?
  erb :'wines/wines'
else
  redirect '/login'
end
end

end
