class Bandaoke < Sinatra::Base

  get '/songs' do
    @songs = Song.all
    erb :'songs/all'
  end

  get '/songs/new' do
    @songs = Genius::Song.search(params[:Song]) if params[:Song]
    p @songs.first.title if @songs
    erb :'songs/new'
  end

  get '/songs/:song_id' do
    @song = Song.get(params[:song_id])
    erb :'songs/full'
  end

  post '/songs/new' do
    title = params[:title]
    artist = params[:artist]
    Song.add_with_roles(title: title, artist: artist)
    redirect '/songs'
  end

end
