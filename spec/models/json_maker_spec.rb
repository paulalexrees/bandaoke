describe Json_maker do

  let(:Json_maker) { described_class }
  let(:song) { double(:song, id: 1, title: 'White', artist: 'Snake')}
  allow(:song).to receive(:roles) { @roles }
  describe '#song_and_roles_json' do
  it 'will exist' do
    expect(Json_maker.song_and_roles_json(Song[0].roles)).to eq(@roles)
  end

  # it 'will call song_and_roles_hash'
  #   Json_maker.song_and_roles_json(song)

end
end

@roles = [@id=1 @instrument="vocals" @player=nil @song_id=1>,
          @id=2 @instrument="guitar" @player=nil @song_id=1>,
          @id=3 @instrument="bass" @player=nil @song_id=1>,
          @id=4 @instrument="drums" @player=nil @song_id=1>,
          @id=5 @instrument="keyboard" @player=nil @song_id=1>, 
          @id=6 @instrument="tambourine" @player=nil @song_id=1>]
