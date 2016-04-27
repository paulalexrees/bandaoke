feature 'viewing available roles' do

  before(:each) do
    @song = Song.add_with_roles(title: "Enter Sandman", artist: "Metallica")
  end

  scenario 'available roles' do
    visit '/songs/1'
    expect(page).to have_content "guitar"
    expect(page).to have_css("input[type=text]")
  end

  scenario 'no available roles' do
    @song.roles.each do |role|
       role.fill("James Hetfield")
    end
    visit '/songs/1'
    expect(page).not_to have_css("input[type=text]")
  end

  scenario 'shows a filled role' do
    visit '/songs/1'
    fill_in :keyboard, with: "Nicole"
    click_button "Submit"
    expect(page).to have_content "Nicole"
    expect(page).not_to have_field "keyboard"
  end

end
