require './app/app'
@songs = Song.all
@array =[]
@songs.each do |song|
  hashsong = Hash["id", song.id, "title", song.title, "artist", song.artist]
  @array << hashsong
end
p @array
p @array.to_json
