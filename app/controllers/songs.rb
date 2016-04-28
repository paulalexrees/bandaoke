class Bandaoke < Sinatra::Base
  get '/songs' do
    @songs = Song.all
    erb :'songs/all'
  end


  get '/search/songs/:terms' do
    SongSearch.find_songs(params[:terms])
  end

  post '/songs/new' do
    title = params[:title]
    artist = params[:artist]
    Song.add_with_roles(title: title, artist: artist)
    redirect '/songs'
  end

end
