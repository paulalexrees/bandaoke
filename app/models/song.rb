class Song
  include DataMapper::Resource
  DEFAULT_ROLES  = [:vocals, :guitar, :bass, :drums, :keyboard, :tambourine]
  property :id, Serial
  property :title, String
  property :artist, String

  has n, :roles

  def self.json_of_all_songs
    array = []
    Song.all.each do |song|
      array << Hash["id", song.id, "title", song.title, "artist", song.artist, "roles", song.json_of_roles ]
    end
    array.to_json
  end

  def json_of_roles
    array = []
    self.roles.each do |role|
      array << Hash[role.instrument, role.player]
    end
    array
  end

  def self.add_with_roles(title:, artist:)
    song = self.create(title: title, artist: artist)
    song.attach_default_roles
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
