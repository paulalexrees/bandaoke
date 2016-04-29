class Bandaoke < Sinatra::Base

  get '/songs' do
    Song.multiple_song_and_roles_json(Song.all)
  end

  get '/songs/new' do
    genius_songs = Genius::Song.search(params[:Song]) if params[:Song]
  end

  get '/songs/:song_id' do
    song = Song.get(params[:song_id])
    song.song_and_roles_json
  end

  post '/songs' do
    binding.pry
    title = params[:title]
    artist = params[:artist]
    Song.add_with_roles(title: title, artist: artist)
    redirect '/songs'
  end

end
