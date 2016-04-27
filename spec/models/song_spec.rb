describe Song do

  let(:song)  { described_class.new(title: "Enter Sandman", artist: "Metallica") }
  let(:number_default_roles) { described_class::DEFAULT_ROLES.size }
  it 'starts as incomplete' do
    expect(song.is_complete?).to be false
  end

  it 'can be marked complete' do
    role = song.roles.new(instrument: "Guitar")
    role.fill("James Hetfield")
    expect(song.is_complete?).to be true
  end

  it 'attaches the default roles' do
    expect(song.roles).to receive(:create).exactly(number_default_roles).times
    song.attach_default_roles
  end
end
