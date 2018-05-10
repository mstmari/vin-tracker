class WineController < ApplicationController

get '/wines' do
  erb :'wines/wines'
end

end
