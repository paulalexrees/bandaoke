class Bandaoke < Sinatra::Base

  get '/songs' do
    @songs = Song.all

    erb :'songs/all'
  end

  # get '/songs/new' do
  #   erb :'songs/new'
  # end

  # post '/songs' do
  #   song = Song.create(title: params[:title], artist: params[:artist])
  #   redirect to '/songs'
  # end

end
