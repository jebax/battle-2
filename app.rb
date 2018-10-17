require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'
require 'pry'

class Battle < Sinatra::Base

  configure do
     set :public_folder, File.expand_path('../public', __FILE__)
   end

  get '/' do
    erb :index
  end

  post '/' do
    $game = Game.new(Player.new(params[:name1]), Player.new(params[:name2]))
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  post '/play' do
    redirect '/attacked'
  end

  get '/attacked' do
    $game.attack
    @game = $game
    erb :attacked
  end

  run! if app_file == $0

end
