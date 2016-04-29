class JsonMaker

  def self.song_and_roles_json(song)
    song_and_roles_hash(song)
  end

  def self.song_and_roles_hash(song)
    puts " IM CALLED HASH"
  end
end

JsonMaker.song_and_roles_json('song')
