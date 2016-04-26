class Song
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :artist, String

  has n, :roles

end
