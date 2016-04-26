class Instrument
  include DataMapper::Resource

  property :id, Serial
  property :type, String

  has n, :roles, through: Resource
end
