describe Song do

  before(:each) do
    @song = Song.new(title: "Enter Sandman", artist: "Metallica")
  end

  it 'starts as incomplete' do
    expect(@song.is_complete?).to be false
  end

  it 'can be marked complete' do
    role = @song.roles.new(instrument: "Guitar")
    role.fill("James Hetfield")
    expect(@song.is_complete?).to be true
  end

end
