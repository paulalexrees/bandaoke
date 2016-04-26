feature 'viewing songs' do
  scenario 'a list of songs' do
    visit '/songs'
    expect(page).to have_content "Enter Sandman"
    expect(page).to have_content "Metallica"
  end
end
