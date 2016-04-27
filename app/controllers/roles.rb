class Bandaoke < Sinatra::Base

  post '/roles' do
    song = Song.get(params[:song_id])
    song.fill_roles(params)
    redirect "/songs/#{song.id}"
  end
end
