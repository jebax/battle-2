feature 'attacking' do
  scenario 'attacking player 2' do
    sign_in_and_play
    click_button 'Attack Joel!'
    expect(page).to have_content "James attacked Joel!"
  end
end
