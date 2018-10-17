require 'sinatra/base'
require 'player'

class Battle < Sinatra::Base

  configure do
     set :public_folder, File.expand_path('../public', __FILE__)
   end

  get '/' do
    erb :index
  end

  post '/' do
    $player_1 = Player.new(params[:name1])
    $player_2 = Player.new(params[:name2])
    redirect '/play'
  end

  get '/play' do
    @name1 = $player_1.name
    @name2 = $player_2.name
    @name2_hp = 100
    erb :play
  end

  post '/play' do
    redirect '/attacked'
  end

  get '/attacked' do
    @name1 = $player_1.name
    @name2 = $player_2.name
    @name2_hp = 100
    erb :attacked
  end

  run! if app_file == $0

end
