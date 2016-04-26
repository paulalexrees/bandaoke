class Song
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :artist, String

  has n, :roles

  def is_complete?
    self.roles.first(player: nil) == nil && self.roles.length != 0
  end

end
