class Bandaoke < Sinatra::Base
  get '/songs' do
    Song.multiple_song_and_roles_json(Song.all)
  end

  get '/search/songs/:terms' do
    SongSearch.find_songs(params[:terms])
  end

  get '/songs/new' do
    genius_songs = Genius::Song.search(params[:Song]) if params[:Song]
  end

  get '/songs/:song_id' do
    song = Song.get(params[:song_id])
    song.song_and_roles_json
  end

  post '/songs' do
    title = params[:title]
    artist = params[:artist]
    lyric_url = params[:lyric_url]
    song = Song.add_with_roles(title: title, artist: artist, lyric_url: lyric_url)
    { 'status': 'complete' }.to_json if song.errors.empty?
  end

end
