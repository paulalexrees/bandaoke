class Bandaoke < Sinatra::Base

  get '/songs' do
    @songs = Song.all
    binding.pry
    erb :'songs/all'
  end

  post '/songs/new' do
    title = params[:title]
    artist = params[:artist]
    Song.add_with_roles(title: title, artist: artist)
    redirect '/songs'
  end

end
