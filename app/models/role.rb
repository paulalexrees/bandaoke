class Role
  include DataMapper::Resource

  property :id, Serial
  property :instrument, String
  property :player, String

  def fill(person)
    self.player = person
    self.save
  end

end
