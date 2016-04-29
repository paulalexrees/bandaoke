class Role
  include DataMapper::Resource

  property :id, Serial
  property :instrument, String
  property :player, String

  def fill(person)
    return if person.empty?
    self.player = person
    self.save
  end

  def found
    'found' if self.player
  end

  def to_hash
    Hash[self.instrument, self.player]
  end

end
