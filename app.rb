require 'sinatra/base'
require 'shotgun'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/play' do
    @name1 = session[:name1]
    @name2 = session[:name2]
    erb :play
  end

  post '/' do
    session[:name1] = params[:name1]
    session[:name2] = params[:name2]
    redirect '/play'
  end

  run! if app_file == $0

end