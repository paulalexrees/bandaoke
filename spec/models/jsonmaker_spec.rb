describe JsonMaker do

  let(:JsonMaker) { described_class }
  before do
    Song.add_with_roles(title: 'White', artist: 'Snake', lyric_url: 'www.lyrics.com')
    Song.add_with_roles(title: 'Black', artist: 'Lizard', lyric_url: 'www.lyrics2.com')
     @song = Song[0]
     @songs = Song.all
  end
  # let(:song) { double(:song, id: 1, title: 'White', artist: 'Snake')}
  # allow(:song).to receive(:roles) { @roles }
  describe '#song_and_roles_json' do


  it 'will call song_and_roles_hash' do
    expect(JsonMaker).to receive(:song_and_roles_hash)
    JsonMaker.song_and_roles_json(@song)

  end
end

end
