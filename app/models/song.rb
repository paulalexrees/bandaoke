class Song
  include DataMapper::Resource
  DEFAULT_ROLES  = [:Vocals, :Guitar, :Bass, :Drums, :Keyboard, :Tambourine]
  property :id, Serial
  property :title, String
  property :artist, String

  has n, :roles

  def initialize(title: , artist:)
    self.title = title
    self.artist = artist
    self.save
    self.attach_default_roles
  end

  def is_complete?
    self.roles.first(player: nil) == nil && self.roles.length != 0
  end

  def attach_default_roles
    DEFAULT_ROLES.each do |instrument|
      create_song_role(instrument)
    end
  end

  private

  def create_song_role(instrument)
    self.roles.create(instrument: instrument)
  end
end
