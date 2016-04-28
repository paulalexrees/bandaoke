class Bandaoke < Sinatra::Base

  get '/songs' do
    Song.json_of_all_songs
  end

  get '/songs/new' do
    genius_songs = Genius::Song.search(params[:Song]) if params[:Song]
  end

  get '/songs/:song_id' do
    song = Song.get(params[:song_id])
  end

  post '/songs/new' do
    title = params[:title]
    artist = params[:artist]
    Song.add_with_roles(title: title, artist: artist)
    redirect '/songs'
  end

end
