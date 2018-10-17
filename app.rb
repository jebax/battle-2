require 'sinatra/base'
require 'shotgun'

class Battle < Sinatra::Base

  configure do
     set :public_folder, File.expand_path('../public', __FILE__)
   end
  enable :sessions

  get '/' do
    erb :index
  end

  post '/' do
    session[:name1] = params[:name1]
    session[:name2] = params[:name2]
    redirect '/play'
  end

  get '/play' do
    @name1 = session[:name1]
    @name2 = session[:name2]
    @name2_hp = 100
    erb :play
  end

  post '/play' do
    redirect '/attacked'
  end

  get '/attacked' do
    @name1 = session[:name1]
    @name2 = session[:name2]
    @name2_hp = 100
    erb :attacked
  end
  
  run! if app_file == $0

end
