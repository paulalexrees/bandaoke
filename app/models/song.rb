class Song
  include DataMapper::Resource
  DEFAULT_ROLES  = [:vocals, :guitar, :bass, :drums, :keyboard, :tambourine]
  property :id, Serial
  property :title, String
  property :artist, String
  property :link, String

  has n, :roles

  def self.add_with_roles(title:, artist:, link:)
    song = self.first_or_create(title: title, artist: artist, link: link)
    return song unless song.roles.empty?
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
