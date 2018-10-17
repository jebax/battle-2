require 'sinatra/base'
require_relative './lib/player'

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
    $player_2.receive_hit
    redirect '/attacked'
  end

  get '/attacked' do
    @name1 = $player_1.name
    @name2 = $player_2.name
    @name2_hp = $player_2.hit_points
    erb :attacked
  end

  run! if app_file == $0

end
