require 'sinatra/base'
require 'shotgun'

class Battle < Sinatra::Base

  get '/' do
    erb(:form)
  end

  post '/game' do
    @name1 = params[:name1]
    @name2 = params[:name2]
    erb(:index)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
