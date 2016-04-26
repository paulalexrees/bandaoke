feature 'viewing available roles' do

  before(:each) do
    @song = Song.create(title: "Enter Sandman", artist: "Metallica")
    @song.roles.create(instrument: "Guitar")
  end

  scenario 'available roles' do
    visit '/songs/1'
    expect(page).to have_content "Guitar"
    expect(page).to have_css("input[type=text]")
  end

  scenario 'no available roles' do
    @song.roles.first.fill("James Hetfield")
    visit '/songs/1'
    expect(page).to have_content "Guitar"
    expect(page).not_to have_css("input[type=text]")
  end

end
