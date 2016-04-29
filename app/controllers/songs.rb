class Bandaoke < Sinatra::Base

  get '/songs' do
    @songs = Song.all
    rabl :songs, format: "json"
    #Song.multiple_song_and_roles_json(Song.all)
  end

  get '/search/songs/:terms' do
    SongSearch.find_songs(params[:terms])
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
