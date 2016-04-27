class Song
  include DataMapper::Resource
  DEFAULT_ROLES  = [:Vocals, :Guitar, :Bass, :Drums, :Keyboard, :Tambourine]
  property :id, Serial
  property :title, String
  property :artist, String

  has n, :roles

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

  private

  def create_song_role(instrument)
    self.roles.create(instrument: instrument)
  end

end
