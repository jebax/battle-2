describe Battle do
  feature 'hit points' do
    scenario 'battle begins and user sees other users hit points' do
      sign_in_and_play
      expect(page).to have_content("Joel\nHP: 100 / 100")
    end

    scenario 'player 2 is hit and HP is reduced' do
      sign_in_and_play
      click_button('Attack Joel!')
      expect(page).to have_content("Joel\nHP: 90 / 100")
    end
  end
end
