class Bandaoke < Sinatra::Base

  get '/songs' do
    @songs = Song.all
    erb :'songs/all'
  end

  get '/songs/:song_id' do
    @song = Song.get(params[:song_id])
    erb :'songs/full'
  end

  # get '/songs/new' do
  #   erb :'songs/new'
  # end

  # post '/songs' do
  #   song = Song.create(title: params[:title], artist: params[:artist])
  #   song.attach_default_roles
  #   redirect to '/songs'
  # end

end
