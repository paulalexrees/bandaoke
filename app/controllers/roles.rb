class Bandaoke < Sinatra::Base

  post '/roles' do
    song = Song.get(params[:song_id])
    role = song.roles.first(params[:instrument])
    role.fill(params[:Guitar])
    redirect "/songs/#{song.id}"
  end

end
