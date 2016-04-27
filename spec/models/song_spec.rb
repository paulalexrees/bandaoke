describe Song do

  let(:number_default_roles) { described_class::DEFAULT_ROLES.size }
  let(:Song) { described_class }
  describe '#complete?' do

    let(:song) { described_class.new(title: "Enter Sandman", artist: "Metallica") }

    it 'starts as incomplete' do
      expect(song).to_not be_complete
    end

    it 'can be marked complete' do
      role = song.roles.new(instrument: "Guitar")
      role.fill("James Hetfield")
      expect(song).to be_complete
    end
  end

  describe '#add_with_roles' do
    let(:song) { Song.add_with_roles(title: "Enter Sandman", artist: "Metallica") }
    it 'attaches the default roles' do
      expect(song.roles.size).to eq(number_default_roles)
    end
  end
end
