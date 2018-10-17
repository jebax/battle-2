require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'
require 'pry'

class Battle < Sinatra::Base

  configure do
    set :public_folder, File.expand_path('../public', __FILE__)
  end

  before do
    @game = Game.current_game
  end

  get '/' do
    erb :index
  end

  post '/' do
    player_1 = Player.new(params[:name1])
    player_2 = Player.new(params[:name2])
    Game.store_game(Game.new(player_1, player_2))
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  post '/play' do
    @game.attack
    redirect '/game_over' if @game.finished?
    redirect '/attacked'
  end

  get '/attacked' do
    erb :attacked
  end

  get '/game_over' do
    erb :game_over
  end

  run! if app_file == $0
end
