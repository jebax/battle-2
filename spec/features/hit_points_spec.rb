describe Battle do
  feature 'start battle' do
    scenario 'battle begins and user sees other users hit points' do
      sign_in_and_play
      expect(page).to have_content("Joel\nHP: 100 / 100")
    end
  end
end
