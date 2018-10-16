require 'sinatra/base'
require 'shotgun'

class Battle < Sinatra::Base

  get '/' do
    erb(:form)
  end

  post '/game' do
    @name = params[:name]
    erb(:index)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
