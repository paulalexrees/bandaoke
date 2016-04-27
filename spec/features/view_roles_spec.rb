feature 'viewing available roles' do

  before(:each) do
    @song = Song.create(title: "Enter Sandman", artist: "Metallica")
    @song.roles.create(instrument: "guitar")
  end

  scenario 'available roles' do
    visit '/songs/1'
    expect(page).to have_content "guitar"
    expect(page).to have_css("input[type=text]")
  end

  scenario 'no available roles' do
    @song.roles.first.fill("James Hetfield")
    visit '/songs/1'
    expect(page).to have_content "guitar"
    expect(page).not_to have_css("input[type=text]")
  end

  scenario 'shows a filled role' do
    visit '/songs/1'
    fill_in :guitar, with: "Nicole"
    click_button "Submit"
    expect(page).to have_content "Nicole"
    expect(page).not_to have_field "guitar"
  end

end
