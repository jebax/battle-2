feature 'hit points' do
  scenario "see player 1's hit points" do
    sign_in_and_play
    expect(page).to have_content("James\nHP: 100 / 100")
  end

  scenario "see player 2's hit points" do
    sign_in_and_play
    expect(page).to have_content("Joel\nHP: 100 / 100")
  end

  scenario 'player 2 is hit and HP is reduced' do
    sign_in_and_play
    click_button('attack_button')
    expect(page).to have_content("Joel\nHP: 90 / 100")
  end
end
