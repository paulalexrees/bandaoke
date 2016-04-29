class Song
  include DataMapper::Resource
  DEFAULT_ROLES  = [:vocals, :guitar, :bass, :drums, :keyboard, :tambourine]
  property :id, Serial
  property :title, String
  property :artist, String
  property :lyric_url, String

  has n, :roles

  def self.add_with_roles(title:, artist:, lyric_url:)
    song = self.first_or_create(title: title, artist: artist, lyric_url: lyric_url)
    return song unless song.roles.empty?
    song.attach_default_roles
  end

  def self.multiple_song_and_roles_hash(songs)
    songs.map do |song|
      song.song_and_roles_hash
    end
  end

  def self.multiple_song_and_roles_json(songs)
    multiple_song_and_roles_hash(songs).to_json
  end

  def song_and_roles_json
    song_and_roles_hash.to_json
  end

  def song_and_roles_hash
    hash = Hash["id", self.id, "title", self.title, "artist", self.artist, "lyric_url", self.lyric_url, "roles", self.hash_of_roles]
  end

  def hash_of_roles
    self.roles.map do |role|
      role.to_hash
    end
  end

  def complete?
    self.roles.first(player: nil) == nil && self.roles.length != 0
  end

  def attach_default_roles
    DEFAULT_ROLES.map do |instrument|
      create_song_role(instrument)
    end
    self
  end

  def fill_roles(roles)
    roles.each do |instrument, player|
      fill_role(instrument, player)
    end
  end

  private


  def create_song_role(instrument)
    self.roles.create(instrument: instrument)
  end

  def find_role(instrument, player)
    self.roles.first(instrument: instrument)
  end

  def fill_role(instrument, player)
    role = find_role(instrument, player)
    role.fill(player) if role
  end

end
