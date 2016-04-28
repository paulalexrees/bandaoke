class Bandaoke < Sinatra::Base
  get '/songs' do
    @songs = Song.all
    erb :'songs/all'
  end


  get '/search/songs/:terms' do
    SongSearch.find_songs(params[:terms])
  end

  post '/songs' do
    title = params[:title]
    artist = params[:artist]
    link = params[:link]
    song = Song.add_with_roles(title: title, artist: artist, link: link)
    { 'status': 'complete' }.to_json if song.errors.empty?
  end

end
