feature 'adding songs' do
  scenario 'option to add a song' do
    visit '/songs'
    expect(page).to have_button "Add Song"
  end

  scenario 'displays a page for adding a song' do
    visit '/songs'
    click_button "Add Song"
    expect(page).to have_field "Song"
  end

  scenario 'shows a list of searched-for songs' do
    visit '/songs/new'
    fill_in :Song, with: "White Room"
    expect(page).to have_content "Cream"    
  end
end
